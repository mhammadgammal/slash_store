import 'package:flutter/material.dart';
import 'package:slash_store/core/router/navigator.dart';
import 'package:slash_store/core/widgets/see_all_row.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categories});

  final List<(String, String)> categories;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraines) => Container(
        padding: const EdgeInsetsDirectional.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium!.fontFamily,
                    ),
                  ),
                ),
                SeeAllRow(
                  onSeeAllRowTab: () =>
                      AppNavigator.navigateToAllCategories(context, categories),
                ),
              ],
            ),
            //Expanded
            Flexible(
              fit: FlexFit.tight,
              child: constraines.maxWidth >= 450.0
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            1, // Adjust the number of columns as needed
                        childAspectRatio:
                            1.0, // Adjust the aspect ratio for the grid items
                        crossAxisSpacing: 10.0, // Spacing between columns
                        mainAxisSpacing: 10.0, // Spacing between rows
                      ),
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (_, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(41, 41, 41, 1.0),
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
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (_, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(41, 41, 41, 1.0),
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
      ),
    );
  }
}
