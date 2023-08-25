import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/themes/colors.dart';

import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 5.0),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 0,
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          Image.asset(
            food.imagePath,
            height: 140,
          ),

          //text
          Text(
            food.name,
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),

          //pricing
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.bold),
                ),

                //rating
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                    Text(food.rating),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
