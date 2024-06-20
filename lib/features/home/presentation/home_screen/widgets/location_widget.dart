import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/Vector.png'),
        SizedBox(
          width: 5.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline:TextBaseline.alphabetic, // Align by text baseline
          children: [
            Text(
              'Nasr City',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Urbanist',
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(width: 4.0), // Add some spacing
            Text(
              'Cairo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Urbanist',
              ),
            ),
          ],
        ),
        const Icon(Icons.keyboard_arrow_down_rounded),
      ],
    );
  }
}
