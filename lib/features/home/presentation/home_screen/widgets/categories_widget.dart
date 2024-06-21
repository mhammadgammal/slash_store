import 'package:flutter/material.dart';
import 'package:slash_store/core/router/navigator.dart';
import 'package:slash_store/core/widgets/see_all_row.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categories});

  final List<(String, String)> categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium!.fontFamily,
                ),
              ),
              SeeAllRow(onSeeAllRowTab: () => AppNavigator.navigateToAllCategories(context, categories),),
            ],
          ),
          //Expanded
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => Column(
                children: [
                  Padding(
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
                  Text(
                    categories[index].$1,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
