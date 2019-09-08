module Cabochon
  module StringUtils
    # Pads string on the left and right sides if it's shorter than length.
    # Padding characters are truncated if they can't be evenly divided by length.
    #
    # ```
    #  pad("test", 8, "-=") # => "-=test-="
    # ```
    #
    # *string*: The string to pad.
    # *length*: The padding length.
    # *chars*: The string used as padding.
    def pad(string : String = "", length : Int = 0, chars : String = " ") : String
      return string if length <= 0
        
      str_length = string.size
      chars_len = chars.size
      return string if length <= str_length 

      mid = (length - str_length) / 2
      rest = (length - str_length) % 2

      left_len = mid + rest
      left = "#{chars * (left_len / chars_len)}#{chars[0, left_len % chars_len]}"
      right = "#{chars * (mid / chars_len)}#{chars[0, mid % chars_len]}"

      return "#{left}#{string}#{right}"
    end

    # Returns true if all characters in the string are digits and there is at least one character, false otherwise.
    #
    # ```
    # digit?("") # => false
    # digit?("abc")   # => false
    # digit?("123")   # => true
    # digit?("12.34") # => false
    # digit?("1.5e5") # => false
    # digit?("-123")  # => false
    # ```
    #
    # *str*: The checked string.
    def digit?(str : String) : Bool
      /^(\d)+$/ === str
    end

    # Returns true if first character capitalized and the rest lowercased and there is at least one cased character, false otherwise.
    #
    # *str*: The checked string
    def capitalize?(str : String) : Bool
      return !str.empty? && str.capitalize == str
    end

    # Return true if all cased characters in the string are lowercase and there is at least one cased character, false otherwise.
    # 
    # ```
    # downcase?("") # => false
    # downcase?("Abc") # => false
    # downcase?("abc") # => true
    # ```
    #
    # *str*: The checked string.
    def downcase?(str : String) : Bool
      return !str.empty? && str.downcase == str
    end

    def downcase?(ch : Char) : Bool
      return ch.lowercase?
    end

    # Return a copy of the string with uppercase characters converted to lowercase and vice versa.
    # *str*: The checked string.
    # def swapcase(str : String) : String
      
    # end

  end
end
