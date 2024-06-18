import 'package:flutter/material.dart';
import 'package:slash_store/core/router/router_helper.dart';

abstract class AppNavigator {

  static navigateToHomeScreen(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.home);

  static navigateToSearch(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.search);

  static navigateToCart(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.cart);

  static navigateToProfile(BuildContext context) =>
      Navigator.popAndPushNamed(context, RouterHelper.profile);
}