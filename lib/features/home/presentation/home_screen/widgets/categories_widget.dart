import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categories});

  final List<(String, String)> categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
                  fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
                ),
              ),
              const Row(children: [
                Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Urbanist'),),
                Icon(Icons.arrow_forward_ios),
              ]),
            ],
          ),
          //Expanded
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ListView.builder(
                        itemBuilder: (_, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(41, 41, 41, 1.0),
                  radius: 35.0,
                  child: Image.asset(categories[index].$2),
                ),
              ),
              Text(categories[index].$1, style: TextStyle(fontSize: 20.0,),),
            ],
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                      ),
          )
        ],
      ),
    );
  }
}
