import 'package:flutter/material.dart';
import 'package:slash_store/core/router/navigator.dart';
import 'package:slash_store/core/widgets/see_all_row.dart';
import '../../../domain/entity/product_model.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget(
      {super.key, required this.header, required this.products});

  final String header;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          top: 10.0, start: 10.0, end: 10.0, bottom: 0.0),
      width: MediaQuery.of(context).size.width,
      height: 280.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                header,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium!.fontFamily,
                ),
              ),
              SeeAllRow(
                onSeeAllRowTab: () =>
                    AppNavigator.navigateToAllProducts(context, products),
              ),
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.asset(
                            products[index].imagePath,
                            width: 150.0,
                            height: 130.0,
                          ),
                          const CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.favorite_border_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        products[index].productName,
                        style: const TextStyle(
                            fontSize: 23.0, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          const Text(
                            'EGP',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            products[index].price.toString(),
                            style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          const CircleAvatar(
                            radius: 13.0,
                            backgroundColor: Colors.black,
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
