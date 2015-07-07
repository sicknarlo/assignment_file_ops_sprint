class DictionaryLoader
	attr_reader :words

	def initialize
		@words = []
	end

	def load_words
		file_lines = File.readlines("5desk.txt")
		file_lines.each do |word|
			@words << word.strip
	 	end
	 	@words
 	end

 	def save(result, filename)
 		File.open(filename,"w") do |file|
    	file.write result
  	end
	end

end

