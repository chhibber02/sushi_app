import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/themes/colors.dart';

import '../components/search_bar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //food menu
  List foodMenu = [
    //salmon
    Food(
      imagePath: 'lib/images/salmon_sushi.png',
      name: "Salmon Sushi",
      price: "2.10",
      rating: "4.9",
    ),

    //tuna
    Food(
      imagePath: "lib/images/tuna.png",
      name: "Tuna",
      price: "2.50",
      rating: "4.8",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: Text(
          "Tokyo Fusion Sushi",
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //promo banner
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //text & button
                  Column(
                    children: [
                      Text(
                        "Get 40% PROMO",
                        style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyButton(
                        text: "Redeem now",
                        onTap: () {},
                      ),
                    ],
                  ),
          
                  //image icon of sushi
                  Image.asset(
                    'lib/images/many_sushi.png',
                    height: 100,
                  ),
                ],
              ),
            ),
          
            const SizedBox(
              height: 20,
            ),
          
            //search bar
            const MySearchBar(),
          
            const SizedBox(height: 25),
          
            //menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Food Menu",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          
            const SizedBox(
              height: 10,
            ),
          
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                    food: foodMenu[index],
                  ),
                ),
              ),
            ),
          
            //popular food
            Container(
              margin: const EdgeInsets.all(25.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //image
                  Row(
                    children: [
                      Image.asset(
                        'lib/images/salmon_eggs.png',
                        height: 60,
                      ),
          
                      const SizedBox(width: 10),
          
                      //name & price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name
                          Text(
                            "Salmon Eggs",
                            style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                          ),
          
                          //price
                          Text(
                            '\$2.00',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
          
                  //heart icon
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
