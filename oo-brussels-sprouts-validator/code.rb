class Ingredient
  attr_reader :name

  SAFE_INGREDIENTS = ["brussels sprouts", "spinach", "eggs",
    "milk", "tofu", "seitan", "bell peppers", "quinoa", "kale",
    "chocolate", "beer", "wine", "whiskey"]

  def initialize(quantity, units, name)
    @quantity = quantity
    @units = units
    @name = name
  end

  def valid_ingredient?
    SAFE_INGREDIENTS.include?(@name.downcase)

  end

  def self.parse(ingredient_string)
    parsed_ingredient = ingredient_string.split(" ")
    name = parsed_ingredient[2..parsed_ingredient.length].join(" ")
    Ingredient.new(parsed_ingredient[0], parsed_ingredient[1], name)
  end

  def summary
    "#{@quantity} #{@units} #{@name}"
  end

end

class Recipe
  attr_reader :name

  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def has_allergens?
    @ingredients.all? { |ingredient| ingredient.valid_ingredient?}
  end

  def summary
    puts "Name #{@name}\n"
    puts "\nIngredients"
    @ingredients.each { |ingredient| puts "- #{ingredient.summary}"}
    puts "\nInstuctions"
    @instructions.each_with_index do |instruction, index|
      puts "#{index + 1}. #{instruction}"
    end
    return
  end
end

####Test Case(s) 1 #####
###Testing for parse method
item1 = Ingredient.parse("3.0 tbspn(s) milk")
puts "Here is an ingredient to test:"
puts item1.summary
puts "Is #{item1.name} safe? #{item1.valid_ingredient?}"
puts

item2 = Ingredient.parse("0.5 tspn(s) Freshly ground black pepper")
puts "Here is an ingredient to test:"
puts item2.summary
puts "Is #{item2.name} safe? #{item2.valid_ingredient?}"
puts

name_veg_eggs = "Veggie Eggs"
ingredients_veg_eggs = [
        Ingredient.new(1.0, "cup", "spinach"),
        Ingredient.new(1, "large", "eggs"),
        Ingredient.parse("0.5 cup bell peppers")
      ]
instructions_veg_eggs = [
        "stir fry spinach.",
        "Pour over eggs.",
        "Add bell peppers."
      ]
veg_eggs_recipe = Recipe.new(name_veg_eggs, instructions_veg_eggs, ingredients_veg_eggs)
puts "Is #{veg_eggs_recipe.name} safe? #{veg_eggs_recipe.has_allergens?}"
puts veg_eggs_recipe.summary
puts

####Test Case 2 #####
####Testing for a safe recipe
safe_name = "Chocolate Quinoa"
safe_ingredients = [
        Ingredient.new(1.0, "cup", "quinoa"),
        Ingredient.new(1.0, "cup", "chocolate")
      ]
safe_instructions = [
        "Melt chocolate.",
        "Pour over quinoa.",
        "Regret your life."
      ]
safe_recipe = Recipe.new(safe_name, safe_instructions, safe_ingredients)
puts "Is #{safe_recipe.name} safe? #{safe_recipe.has_allergens?}"
puts

####Test Case 3#####
#Testing for an unsafe recipe
name_salmon = "Baked Salmon"
ingredients_salmon = [
  Ingredient.new(16.0, "oz", "salmon filet"),
  Ingredient.new(0.5, "cup", "salted butter melted"),
  Ingredient.new(4.0, "tbspn(s)", "fresh lemon juice"),
  Ingredient.new(4.0, "tbspn(s)", "garlic cloves crushed"),
  Ingredient.new(2, "tbspn(s)", "kale")
]

instructions_salmon = [
  "Pour butter mixture directly over salmon.",
  "Pull the sides and ends of the aluminum foil up and pinch together, covering the salmon completely.",
  "Preheat oven to 375 degrees.",
  "Line a 4 sided baking sheet with aluminum foil. Place the salmon in the middle of the foil.",
  "In a glass measuring cup, combine melted butter, lemon juice, garlic, and dill. Whisk together.",
  "Bake in the preheated oven for 15-20 minutes, or until the salmon flakes easily with a fork."
]
recipe_salmon = Recipe.new(name_salmon, instructions_salmon, ingredients_salmon)
#puts recipe_salmon.summary
puts "Is #{recipe_salmon.name} safe? #{recipe_salmon.has_allergens?}"
