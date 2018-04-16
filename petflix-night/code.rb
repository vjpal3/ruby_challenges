dramas = [
  "Stanger Llamas",
  "Game of Bones",
  "Llama Actually",
  "Grey's Catanomy",
  "Breaking Baaaaahhhd"
]

animations = [
  "Bojack Man",
  "Family Dog",
  "Futurellama",
  "Barkcher",
  "American Dog",
  "Pokemon",
  "Bob's Barkers"
]

comedies = [
  "Barks and Recreation",
  "30 Cats",
  "Bones",
  "Girl meets Cat",
  "Gilmore Cats",
  "New Dog",
  "Catlandia",
  "Full Mouse"
]

all_shows = [
  "Stanger Llamas",
  "Game of Bones",
  "Llama Actually",
  "Grey's Catanomy",
  "Breaking Baaaaahhhd",
  "Bojack Man",
  "Family Dog",
  "Futurellama",
  "Barkcher",
  "American Dog",
  "Pokemon",
  "Bob's Barkers",
  "Barks and Recreation",
  "30 Cats",
  "Bones",
  "Girl meets Cat",
  "Gilmore Cats",
  "New Dog",
  "Catlandia",
  "Full Mouse"
]

#YOUR CODE GOES HERE
# We heard raving reviews about all the llama dramas on Petflix!
#Let's write a line of code to return every show in the dramas array that has the word "Llama" in it.
llama_drama = dramas.select {|item| item.include?("Llama")}
puts "Llama Dramas:"
puts llama_drama
puts ""

# Our significant other is a significant dog person.
#Let's write a line of code to return every show in our animations array that has the word "Dog" in it.
dog_animations = animations.find_all {|item| item.include?("Dog")}
puts "Dog Animations:"
puts dog_animations
puts ""

# We are very picky when it comes to our funny tv shows.
#Write a line of code that will return every show in our comedies array that does NOT have the word "Cat" in it.
comedies_no_cats = comedies.reject {|item| item.include?("Cat")}
puts "Comedies without Cats:"
puts comedies_no_cats
puts ""

# As humans, we prefer order, so we want to get a head start in alphabetizing our pet show collection.
#Let's take a look at our all_shows array and map out the first character of every show.
#In other words, write a line of code that will return an array of every show's first letter in our all_shows array.
all_shows_first_letter = all_shows.map {|item| item[0]}
puts "All shows first letter:"
puts all_shows_first_letter
puts ""
