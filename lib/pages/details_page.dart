import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/themes/colors.dart';

import '../models/food.dart';

class DetailsPage extends StatefulWidget {
  final Food food;
  const DetailsPage({super.key, required this.food});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantity > 0) quantity--;
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  //add to cart
  void addToCart() {
    //if cart has items
    if (quantity > 0) {
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantity);

      //let user know item has been added to cart
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Succefully Added To Cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            //okay button
            Center(
              child: IconButton(
                onPressed: () {
                  //pop once to remove dialog box
                  Navigator.pop(context);

                  //pop again to go to previous screen
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
        ),
        body: Column(
          children: [
            //listview of food details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView(
                  children: [
                    //image
                    Image.asset(
                      widget.food.imagePath,
                      height: 200,
                    ),

                    //rating
                    Row(
                      children: [
                        //star
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),

                        const SizedBox(width: 10),

                        //rating number
                        Text(
                          widget.food.rating,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    //food name
                    Text(
                      widget.food.name,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                    ),

                    const SizedBox(height: 25),

                    //description
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Experience the essence of pure delight with our 'Salmon Sushi'. This classic creation embodies the heart of sushi craftsmanship, featuring tender slices of premium salmon draped over impeccably seasoned sushi rice. The salmon's velvety texture and delicate flavor are the stars of this dish, harmonizing beautifully with the subtle notes of vinegar-kissed rice. Each bite is a testament to the artistry of simplicity, allowing the natural elegance of the ingredients to shine.",
                      style: TextStyle(
                        height: 2,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //price + quantity + add to cart button
            Container(
              color: primaryColor,
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  //price + quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Text(
                        "\$${widget.food.price}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      //quantity
                      Row(
                        children: [
                          //minus button
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: decrementQuantity,
                            ),
                          ),

                          //quantity count
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          //plus button
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: incrementQuantity,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  //add to cart button
                  MyButton(
                    text: "Add to cart",
                    onTap: addToCart,
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
