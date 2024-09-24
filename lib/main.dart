import 'package:flutter/material.dart';
import 'DetailsScreen.dart';

void main() {
  runApp(MaterialApp(// the themes for the overall app 
    home: MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      textTheme: TextTheme(
        bodySmall: TextStyle(
          fontSize: 16.0,
          color: const Color.fromARGB(255, 192, 48, 48),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromRGBO(123, 159, 223, 1), // Background color
        titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(
        color: Colors.blue, // Color for icons
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> recipes = [
    "Pancakes",
    "Omelette",
    "Ham Sandwich"
  ];

  final Map<String, String> recipeImages = { //pictures for the thumbnail 
    "Pancakes": "https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_auto,w_1500,ar_3:2/k%2FPhoto%2FRecipes%2F2024-06-seo-pancakes%2Fseo-pancakes-232",
    "Omelette": "https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2021/12/How-to-Make-an-Omelette-17.jpg",
    "Ham Sandwich": "https://www.seriouseats.com/thmb/j4q7hzhs2rgUFbMIJ6TyOIkWWdY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20240305-SEA-HamandCheese-Amanda-Suarez-herojpg-5f7304ba4a7e43018052d2056495c266.jpg",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(// the list for recipes 
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            String recipe = recipes[index];
            String imageUrl = recipeImages[recipe] ?? '';

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(recipe: recipe),
                    ),
                  );
                },
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.network(
                        imageUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 150,
                            width: 150,
                            color: Colors.grey,
                            child: Icon(Icons.broken_image, size: 50, color: Colors.white),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Tap to view details',// for the buttons of the recipe 
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.blue),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
