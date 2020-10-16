require "pry"
#We are trying to take a word and compare it to a bunch of other words to see whether there is a match between the two sets of words. If there are, we wish to return them and tally how many times they match up.

#Does your program have a user interface? What will it look like? What functionality will the interface have? Sketch this out on paper.
  #No, no user interface other than the command line

#What inputs will your program have? Will the user enter data or will you get input from somewhere else?
  #The user will input a string from the command line

#What’s the desired output?
  #The desired output is a hash that contains the words that match up and the number of times they do.

#Given your inputs, what are the steps necessary to return the desired output?

  #When the user inputs a string
  #Pass the user's input to a variable
  #Turn that variable into an array
  #run a loop that compares whether elements in the string array are included in the dictionary array
  #Push elements that match to a third array
  #reduce the array into a hash
  #Return the hash to the user


def substrings(string, dictionary)
  last_array = []
  array = string.downcase.split(" ")
  for string in array do
    dictionary.select {|word|
      word_lowercase = word.downcase
      if string.include?(word_lowercase) == true
        last_array.push(word_lowercase)
      end
    }
  end

  tally = last_array.sort.reduce(Hash.new(0)) do |words, times|
    words[times] += 1
    words
  end

  puts tally
end


dictionary = ["below", "down", "go", "going", "horn", "How", "Howdy", "it", "i", "low", "own", "part", "partner", "sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)
