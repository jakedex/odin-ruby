def caesar_cipher(plain_text, shift)
  encrypted_text = ""

  plain_text.each_byte do |byte|
    conv_byte = 0
    case byte
    when 65..90 #lowercase letter
      conv_byte = byte + shift
      conv_byte -= conv_byte > 90 ? 26 : 0 #past z?
    when 97..122 #uppercase letter
      conv_byte = byte + shift
      conv_byte -= conv_byte > 122 ? 26 : 0 #past z?
    else
      conv_byte = byte
    end
    encrypted_text << conv_byte
  end

  encrypted_text
end

if $PROGRAM_NAME == __FILE__
  puts caesar_cipher("What a string!", 5)
  puts caesar_cipher("qertyhuujknhgfd", 263)
	puts caesar_cipher("WhaT, As...", -7)
end
