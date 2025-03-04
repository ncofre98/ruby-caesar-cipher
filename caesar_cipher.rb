#!/usr/bin/env ruby

def is_upcased?(letter)
  letter >= 'A' && letter <= 'Z'
end

def is_downcased?(letter)
  letter >= 'a' && letter <= 'z'
end

def shift_letter(letter, right_shift)
  base_upcase = 'A'.ord #65
  base_downcase = 'a'.ord #97
  shifted = letter
  
  if (is_upcased?(letter))
    shifted = (((letter.ord + right_shift - base_upcase) % 26) + base_upcase).chr
  elsif (is_downcased?(letter))
    shifted = (((letter.ord + right_shift - base_downcase) % 26) + base_downcase).chr
  end

  shifted
end

def caesar_cipher(string, right_shift)
  ciphered = string.split('').map { |letter| shift_letter(letter, right_shift) }
  ciphered.join('')
end

def main()
  puts "Welcome to Caesar Shift Encoder"
  puts "Type in the string you want to encode followed by Enter:"
  string = gets.chomp
  puts "Type in the right shift you want:"
  right_shift = gets.chomp.to_i
  encoded = caesar_cipher(string, right_shift)

  puts "Original Message: #{string}"
  puts "Encoded Message with #{right_shift} right shift: #{encoded}"
end

main
