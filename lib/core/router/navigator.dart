import 'package:flutter/material.dart';
import 'package:slash_store/core/router/router_helper.dart';
import 'package:slash_store/features/home/domain/entity/product_model.dart';

abstract class AppNavigator {
  static navigateToLayout(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.layout);

  static navigateToAllCategories(context, List<(String, String)> categories) =>
      Navigator.pushNamed(context, RouterHelper.seeAllCategories,
          arguments: categories);

  static navigateToAllProducts(context, List<ProductModel> products) =>
      Navigator.pushNamed(context, RouterHelper.seeAllProducts,
          arguments: products);

  static navigateToPopPush(BuildContext context, String route) =>
      Navigator.popAndPushNamed(context, route);

  static navigateToPush(BuildContext context, String route) =>
      Navigator.pushNamed(context, route);
}
