# frozen_string_literal: true
require 'net/http'
require 'net/https'

# can be called by running `rake "generate_translations[PL]"` to target Polish
# or `rake generate_translations` to target default language defined in TARGET_LANGUAGES
desc 'Generate translation files using DeepL API'
TARGET_LANGUAGES = %w[PL].freeze
ROOT_LOCALES_DIR = Rails.root.join('config/locales').freeze
BASE_LANGUAGE = 'EN'

task 'generate_translations', [:lang] do |_t, args| # rubocop:disable Rails/RakeEnvironment
  puts "Targeting Languages: #{targeted_languages(args).join(', ')}"
  puts "Base Language: #{BASE_LANGUAGE}"
  puts "Root Locales Directory: #{ROOT_LOCALES_DIR}"

  file_paths = all_file_paths
  base_language_files = base_language_file_paths(file_paths)

  base_language_files.each do |base_language_file|
    targeted_languages(args).each do |target_language|
      generated_content = generate_target_language_content(base_language_file, target_language)
      write_to_file(generated_content, base_language_file, target_language)
    end
  end
end

def write_to_file(generated_content, base_language_file, target_language)
  target_language_file = generate_target_file_name(base_language_file, target_language)
  File.write(target_language_file, YAML.dump(generated_content))
end

def generate_target_language_content(base_language_file, target_language)
  base_language_file_contents = YAML.load_file(base_language_file)
  target_language_file = generate_target_file_name(base_language_file, target_language)
  target_language_file_contents =
    if target_file_exists?(target_language_file)
      YAML.load_file(target_language_file)
    else
      { target_language.downcase.to_s => {} }
    end
  target_updated = recursive_key_setting(
    target_language_file_contents[target_language.downcase.to_s],
    base_language_file_contents['en'],
    target_language
  )
  target_language_file_contents[target_language.downcase.to_s] = target_updated
  target_language_file_contents
end

def recursive_key_setting(target_content, base_content, targeted_language)
  base_content.each_key do |key|
    if base_content[key].is_a?(Hash)
      target_content = assign_key_to_empty_hash(target_content, key)
      recursive_key_setting(target_content[key], base_content[key], targeted_language)
    elsif base_content[key].is_a?(String) && target_content[key].nil?
      target_content[key] = translate_to_targeted_language(base_content[key], targeted_language)
    end
  end
  target_content
end

def assign_key_to_empty_hash(target_content, key)
  target_content[key] = {} if target_content[key].nil? || target_content[key].blank?
  target_content
rescue NoMethodError
  target_content = {}
  target_content[key] = {}
  target_content
end

def translate_to_targeted_language(text, target_language)
  puts("Translating #{text} to #{target_language}")
  uri = URI.parse('https://api-free.deepl.com/v2/translate')
  headers = { 'Authorization' => "DeepL-Auth-Key 354d9a33-d455-afb7-94bd-55a9ac80d8cd:fx" }
  params = { 'text' => text, 'target_lang' => target_language.upcase.to_s, 'source_lang' => BASE_LANGUAGE }

  res = Net::HTTP.post(uri, URI.encode_www_form(params), headers)
  if res.is_a?(Net::HTTPOK)

    body = JSON.parse(res.body)
    translation = body['translations'].first
    if translation['detected_source_language'] == 'EN'
      value = translation['text']
    else
      pp(translation)
    end
  else
    puts(text)
    puts("failed at #{text} to #{target_language}")
    exit
  end
  value
end

def target_file_exists?(target_language_file)
  File.exist?(target_language_file)
end

def generate_target_file_name(base_language_file, target_language)
  base_language_file.gsub("#{BASE_LANGUAGE.downcase}.yml", "#{target_language.downcase}.yml")
end

def seperate_foreign_languages_by_language(foreign_language_files)
  foreign_language_files.each_with_object({}) do |file_path, hash|
    language = file_path.last(6).first(2)
    if hash[language].nil?
      hash[language] = [file_path]
    else
      hash[language] << file_path
    end
  end
end

def all_file_paths
  file_paths = Dir.glob("#{ROOT_LOCALES_DIR}/**/*").reject { |path| File.directory?(path) }

  remove_non_yml_files(file_paths)
end

def base_language_file_paths(file_paths)
  file_paths.select { |file_path| file_path.include?("#{BASE_LANGUAGE.downcase}.yml") }
end

def remove_non_yml_files(file_paths)
  file_paths.select { |file_path| file_path.end_with?('.yml') }
end

def targeted_languages(args)
  if args[:lang].nil?
    TARGET_LANGUAGES
  else
    [args[:lang]]
  end
end
