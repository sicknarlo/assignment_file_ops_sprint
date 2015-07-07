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


end