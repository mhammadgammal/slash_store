class ProductModel {
  int id;
  String productName;
  double price;
  String imagePath;

  ProductModel(
      {required this.id,
      required this.productName,
      required this.price,
      required this.imagePath});

  factory ProductModel.fromJson(Map<String, dynamic> productsResponse) {
    return ProductModel(
        id: productsResponse['id'],
        productName: productsResponse['name'],
        price: productsResponse['price'],
        imagePath: productsResponse['image']);
  }
}
