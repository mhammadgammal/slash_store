import 'package:flutter/material.dart';
import 'package:slash_store/features/home/domain/entity/product_model.dart';

class SeeAllProductsScreen extends StatelessWidget {
  const SeeAllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products =
        ModalRoute.of(context)?.settings.arguments as List<ProductModel>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
        return ListTile(
          leading: Image.asset(products[index].imagePath),
          title: Text(products[index].productName, style: TextStyle(fontSize: 20.0),),
          subtitle: Row(
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
            ],
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: 13.0,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.favorite_border_outlined),
                  ),
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              CircleAvatar(
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
        );
      }),
    );
  }
}
