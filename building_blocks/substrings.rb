def substrings(text, substrings)
  results = {}
  text.downcase!

  substrings.each do |substring|
    count = text.scan(substring).length
    results[substring] = count unless count < 1
  end

  puts results
end

if $PROGRAM_NAME == __FILE__
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  substrings("Howdy partner, sit down! How's it going?" , dictionary)
end
