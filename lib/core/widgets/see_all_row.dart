import 'package:flutter/material.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow({super.key, required this.onSeeAllRowTab});

  final void Function() onSeeAllRowTab;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
        onTap: onSeeAllRowTab,
        child: const Text(
          'See all',
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: 'Urbanist'),
        ),
      ),
      const Icon(Icons.arrow_forward_ios),
    ]);
  }
}
