import 'package:flutter/material.dart';
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
      padding: const EdgeInsetsDirectional.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 250.0,
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
              const SeeAllRow(),
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(products[index].imagePath),
                        const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.favorite_border_outlined),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(products[index].productName),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Text(
                          'EGP',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(products[index].price.toString()),
                        const SizedBox(
                          width: 30.0,
                        ),
                        const CircleAvatar(
                          radius: 10.0,
                          backgroundColor: Colors.black,
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
