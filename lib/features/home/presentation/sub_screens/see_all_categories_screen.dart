import 'package:flutter/material.dart';

class SeeAllCategoriesScreen extends StatelessWidget {
  const SeeAllCategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<(String, String)> categories =
        ModalRoute.of(context)?.settings.arguments as List<(String, String)>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
        return ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(41, 41, 41, 1.0),
              radius: 35.0,
              child: Image.asset(
                categories[index].$2,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            categories[index].$1,
            style: const TextStyle(fontSize: 20.0),
          ),
        );
      }),
    );
  }
}
