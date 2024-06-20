import 'package:flutter/material.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Text(
        'See all',
        style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist'),
      ),
      Icon(Icons.arrow_forward_ios),
    ]);
  }
}
