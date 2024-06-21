import 'package:flutter/material.dart';
import 'package:slash_store/core/router/router_helper.dart';

abstract class AppNavigator {
  static navigateToLayout(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.layout);

  static navigateToHomeScreen(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.home);

  static navigateToSearch(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.search);

  static navigateToCart(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.cart);

  static navigateToProfile(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.profile);

  static navigateToFavorite(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.favorites);

  static navigateToPopPush(BuildContext context, String route) {
    Navigator.popAndPushNamed(context, route);
  }

  static navigateToPush(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }
}
