# require modules here
require 'yaml'

def load_library(path)
  library = YAML.load_file(path)
  final = Hash.new

  final = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  library.each do |meaning, emoticons|
    final["get_meaning"][emoticons[1]] = meaning
    final["get_emoticon"][emoticons[0]] = emoticons[1]
  end

  final
end

def get_japanese_emoticon(library_path, emoticon)
  library = load_library(library_path)
  library["get_emoticon"][emoticon].nil? ? ("Sorry, that emoticon was not found") : (library["get_emoticon"][emoticon])
end

def get_english_meaning(library_path, emoticon)
  library = load_library(library_path)
  library["get_meaning"][emoticon].nil? ? ("Sorry, that emoticon was not found") : (library["get_meaning"][emoticon])
end
