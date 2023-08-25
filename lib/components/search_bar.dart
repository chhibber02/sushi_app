import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow:  [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 0,
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Expanded(
              child: TextField(
                autocorrect: false,
                enableSuggestions: false,
                style: TextStyle(color: Colors.grey[900], fontSize: 18, decorationThickness: 0),
                decoration: InputDecoration(
                  icon: const Icon(Icons.search),
                  border: InputBorder.none,
                  iconColor: Colors.grey[900],
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey[700], fontSize: 18,),
                ),
              ),
            ),
          );
  }
}