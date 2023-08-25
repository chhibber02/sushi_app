import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/themes/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25
            ),


            //shop name
            Text(
              "TOKYO FUSION SUSHI",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 25
            ),

            
            //icon
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset(
                  'lib/images/salmon_eggs.png',
                ),
              ),
            ),

            const SizedBox(height: 25),

            //title
            Text(
              "DISCOVER SUSHI, THE TASTE OF JAPAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),
            //subtitle
            Text(
              "Feel the taste of the most famous Japanese food, from anywhere, at anytime",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),

            const SizedBox(height: 10),
            //get started button
            MyButton(
              text: 'Get Started',
              onTap: () => Navigator.pushNamed(context, 'menuPage'),
            ),
          ],
        ),
      ),
    );
  }
}
