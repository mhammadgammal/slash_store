import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categories});

  final List<(String, String)> categories;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: Theme.of(context).textTheme.displayLarge!.fontFamily,
          ),
        )
      ],
    );
  }
}
