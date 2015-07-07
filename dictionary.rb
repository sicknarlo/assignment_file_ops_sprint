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
		def run
			analyze = DictionaryAnalyzer.new
			result = nil
			puts "What word would you like to search for? "
			word_to_search = gets.chomp
			result = search_type(analyze, word_to_search)
			puts result
			puts "Save result? [Y/N]"
			save(result) if gets.chomp.downcase == "y"

		end


	def search_type(analyze, word_to_search)
		puts "What type of search (exact match, partial match, begins with, ends with)? "
			search_type = gets.chomp
			case search_type
				when "exact match"
					result = analyze.exact_match(word_to_search)
				when "partial match"
					result = analyze.partial_match(word_to_search)
				when "begins with"
					result = analyze.begins_with(word_to_search)
				when "ends with"
					result = analyze.ends_with(word_to_search)
				else
					return "Invalid entry"
			end
			result
	end

	def save(result)
 		puts "What would you like to name your file?"
 		filename = gets.chomp
 		File.open(filename+".txt","w") do |file|
    		file.write result
  		end
	end
end


class DictionaryAnalyzer

	attr_reader :words

	def initialize
		dict = DictionaryLoader.new
		@words = dict.load_words
		# p @words
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

	# def search(word, options = {})
	# 	return exact_match(word) if options[:exact_match]
	# 	return partial_match(word) if options[:partial_match]
	# 	return begins_with(word) if options[:begins_with]
	# 	return ends_with(word) if options[:ends_with]
	# end

	def exact_match(word)				#/\b"#{word}"\b/
		@words.each do |word_from_dict|
			return word_from_dict if word_from_dict == word
		end
		puts "No match"
	end

	def partial_match(word)				#/#{word}/
		result = []
		@words.each do |word_from_dict|
			result << word_from_dict if word_from_dict.include?(word)
		end
		result
	end

	def begins_with(word)
		result = []
		@words.each do |word_from_dict|
			result << word_from_dict unless word_from_dict.match(/^#{word}\w+/).nil?
		end
		result
	end

	def ends_with(word)
		result = []
		@words.each do |word_from_dict|
			result << word_from_dict unless word_from_dict.match(/\w+#{Regexp.quote(word)}$/).nil?
		end
		result
	end
end

a = Dictionary.new
a.run