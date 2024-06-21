import 'package:flutter/material.dart';

class BottomNavBarWithAboveIndicator extends StatelessWidget {
  const BottomNavBarWithAboveIndicator({
    super.key,
    required this.currentBottomNavIndex,
    required this.bottomNavItems,
    required this.changeCurrentBottomNavIndex,
  });

  final int currentBottomNavIndex;
  final List<(String, String, Widget)> bottomNavItems;

  final Function(int) changeCurrentBottomNavIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          currentIndex: currentBottomNavIndex,
          onTap: changeCurrentBottomNavIndex,
          fixedColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          unselectedLabelStyle: const TextStyle(
              color: Colors.black, fontSize: 15.0, fontFamily: 'Urbanist'),
          selectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
          items: List.generate(
            bottomNavItems.length,
            (index) => BottomNavigationBarItem(
              icon: Image.asset(bottomNavItems[index].$1),
              label: bottomNavItems[index].$2,
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Positioned(
          top: 0,
          left: MediaQuery.of(context).size.width /
              bottomNavItems.length *
              currentBottomNavIndex,
          width: MediaQuery.of(context).size.width / bottomNavItems.length,
          child: Center(
            child: Container(
              width: 100.0,
              height: 8.0,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
