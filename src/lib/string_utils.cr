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
  end
end
