import 'package:flutter/material.dart';

import '../../../domain/entity/product_model.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key, required this.recommended});

  final List<ProductModel> recommended;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
