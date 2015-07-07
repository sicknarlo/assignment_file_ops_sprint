=begin
1. class Dictionary
	- user interaction loop
		- get word to look up from the command line
		- should be able to quit and exit the program
	- once search is complete, ask user to save file or display to screen
		- if saving to a file
			- get file name
			- if it exists, ask whether to overwrite

2. Dictionary loader
	- reads dictionary file
	- output: entire dictionary

3. DictionaryAnalyzer
	- get entire dictionary
	- provides simple stats: word count, words per letter
	- perfrom one of 4 search types
		- exact match
		- partial match
		- begins with
		- ends with
		- return full word regardless of match type
=end


require_relative './dictionary_loader.rb'

class Dictionary

end


class DictionaryAnalyzer

	attr_reader :words

	def load_words
		dict = DictionaryLoader.new
		@words = dict.load_words
	end

	# Word Stats
	def stats(options = {})
		@words.length if options[:word_count]
		if options[:words_per_letter]
			p "Enter a letter >>"
			char = gets.chomp.upcase
			@words.count {|word| word[0].upcase == "#{char}"}
		end
	end

	def search(word, options={})
		exact_match(word) if options[:exact_match]
		partial_match(word) if options[:partial_match]
		begins_with(word) if options[:begins_with]
		ends_with(word) if options[:ends_with]
	end

	def exact_match?(word)
		@words.each do |word_from_dict|
			return true unless word_from_dict.match(/word/).nil?
		end
	end

end