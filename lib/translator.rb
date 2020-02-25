# require modules here
require "yaml"


def load_library(file)
  # code goes here
  ans = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons = YAML.load_file(file)
  emoticons.each do |key, value|
    ans['get_meaning'][value[1]] = key
    ans['get_emoticon'][value[0]] = emoticons[key][1]
  end
  ans
    
end

def get_japanese_emoticon(file, jEmotion)
  # code goes here
  hash = load_library(file)
  if !hash['get_emoticon'][jEmotion]
    return "Sorry, that emoticon was not found"
  end
  hash['get_emoticon'][jEmotion]
end

def get_english_meaning(file, eEmotion)
  # code goes here
  hash = load_library(file)
  hash.each |key, value| do 
    if value.include?(eEmotion)
      return key
    end
  end
  puts "Sorry, that emoticon was not found"
end