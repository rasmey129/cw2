import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String recipe;

  DetailsScreen({required this.recipe});

  final Map<String, Map<String, dynamic>> recipeDetails = {//for the format and text of the recipes for each page 
    "Pancakes": {
      "description": "Fluffy pancakes with syrup and butter.",
      "image": "https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_auto,w_1500,ar_3:2/k%2FPhoto%2FRecipes%2F2024-06-seo-pancakes%2Fseo-pancakes-232",
      "ingredients": [
        "1 1/2 cups of all-pupurpose Flour",
        "2 tablespoons Sugar",
        "1 tablespoon Baking powder",
        "1 1/4 cups of Milk",
        "5 tablespoon Unsalted Butter",
        "1 large egg",
        "1/2 teaspoon of fine salt",
        "2 teaspoon vanilla extract"
       ],
      "instructions": [
        "1. Melt the butter and set it aside. In a medium bowl, whisk together the flour, sugar,baking powder and salt",
        "2. In a speeprate bowl, whisk together milk, egg, melted butter, and vaniall extract",
        "3. Create a well in the center of your dry ingredients. Pour in the milk mixture and stir gently until incorporated. As the batter sits it should start to bubble",
        "4. Place a griddle over medium heat.",
        "5. Brush the girddle with melted butter.",
        "6. Scoop the batter onto the griddle and spread each pancake into a 4-inch circle.",
        "8. Serve with syrup, butter, and berries. "
      ]
    },
    "Omelette": {
      "description": "A classic omelette.",
      "image": "https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2021/12/How-to-Make-an-Omelette-17.jpg",
      "ingredients": [
        "2 large eggs",
        "Kosher salt",
        "Ground black pepper",
        "Olive oil, butter or bacon grease"
     ],
      "instructions":[
        "1. in a bowl, whisk the eggs, salt and pepper together until lightly frothy",
        "2. in a non-stick pan, heat the oil or butter over medium-low heat. Pour the ggs and tilt the pan to make sure they're evenly spread. turn down the heat to low.",
        "3. Cook until the edgs are cook through and the top is slightly wet but not runny.",
        "4. use a spatula to fold one half on top and slide the omelette onto a plate. Garnish with herbs to taste."
      ]
    },
    "Ham Sandwich":{
      "description": "Delicious ham sandwich.",
      "image": "https://www.seriouseats.com/thmb/j4q7hzhs2rgUFbMIJ6TyOIkWWdY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20240305-SEA-HamandCheese-Amanda-Suarez-herojpg-5f7304ba4a7e43018052d2056495c266.jpg",
      "ingredients": [
        "Four Thick slices of bread",
        "2 tablespoon mayonnaise or unsalted butter ",
        "2 teaspoon digon mustard",
        "8 thin slices of Swiss, Gruyere or your choice of cheese",
        "6 ounces or about 12 slices thinly slice ham",
        "pickles chips"
      ],
      "instructions": [
        "1. preheat the skillet over medium-high heat.",
        "2. spread one side of each slice of bread with 1 teaspoon of butter or mayonnaise.",
        "3. place one slice butter-side down in the hot skillet. Top with cheese and ham slices.",
        "4. spread mayonnaise and mustard on the second slice of bread and place it butter side up on the sandwich.",
        "5. cook in the hot skille tuntil golden brown and cheese is melted.",
        "6. Big back in peace."
      ]
    },
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final recipeInfo = recipeDetails[recipe];

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [//for importing the images
              if (recipeInfo != null && recipeInfo["image"] != null) //in case the images and recipe instruction doesn't exist
                Image.network(
                  recipeInfo["image"]!, 
                  height: 200, 
                  width: double.infinity,
                  
                  fit: BoxFit.cover, 
                  errorBuilder: (context, error, stackTrace) {
                    return Text('Image failed to load.'); //shows an error 
                  },
                ),
              SizedBox(height: 16.0),
              Text(
                recipeInfo != null ? recipeInfo["description"] ?? "No details available." : "Recipe not found.",
                style: TextStyle(fontSize: 16.0),//if there's no recipe 
              ),
              SizedBox(height: 20.0),
              if (recipeInfo != null && recipeInfo["ingredients"] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    "Ingredients:", //for the ingredients 
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    for (var ingredient in recipeInfo["ingredients"] as List<String>)
                      Text("- $ingredient", style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              SizedBox(height: 20.0),
              if (recipeInfo != null && recipeInfo["instructions"] != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Instructions:", //for instructions
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    for (var step in recipeInfo["instructions"] as List<String>)
                      Text("• $step", style: TextStyle(fontSize: 16.0)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
