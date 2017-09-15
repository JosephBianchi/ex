def check_syntax(str)
  openables = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
    "<" => ">"
  }
  open = []
  opening_chars = openables.keys
  closing_chars = openables.values

  str.each_char do |char|

    if opening_chars.include?(char) # opening bracket
      open << char
    elsif closing_chars.include?(char) # closing bracket
      required_char = openables.key(char)
      open.delete(required_char)
      if open.any?
        required_char = openables[open.last]
        puts "* You have a syntax error: there is #{char} the string ended without a closing #{required_char} "
      end
   end
 end




  return open.empty?
end

puts check_syntax("(this)[] is some text")
puts "*****"
puts check_syntax("(this)] is some text")
puts "*****"
puts check_syntax("[(this] is some text")
puts "*****"
puts check_syntax("[this][ is some text")
puts "*****"
puts check_syntax("[this] is some text")
puts "*****"
puts check_syntax("<html> (this)[] is some text</html>")
puts "*****"
puts check_syntax("<html> (this)] is some text</html>")
puts "*****"
puts check_syntax("<html> [(this] is some text</html>")
puts "*****"
puts check_syntax("<html> [this][ is some text</html")
puts "*****"
puts check_syntax("<html> [this] is some text</html")
puts "*****"
