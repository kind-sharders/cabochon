module Cabochon
  module StringUtils
    # Pads string on the left and right sides if it's shorter than length.
    # Padding characters are truncated if they can't be evenly divided by length.
    #
    # *string* : The string to pad.
    # *length* : The padding length.
    # *chars* : The string used as padding.
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

    # Return true if all characters in the string are digits and there is at least one character, false otherwise.
    # *str* : The checked string.
    def digit?(str : String) : Bool
      return false if str.empty?

      is_digit = true
      i = 0
      while i < str.size 
        if !(48..57).includes?(str[i].ord)
          is_digit = false
          break
        end
        i += 1
      end
      return is_digit
    end


  end
end
