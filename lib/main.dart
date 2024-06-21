import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_store/bloc_observer.dart';
import 'package:slash_store/core/router/router.dart';
import 'package:slash_store/core/router/router_helper.dart';
import 'package:slash_store/core/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SlashObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slash Store',
      theme: AppTheme.lightTheme,
      routes: AppRouter.generateRoutes,
      initialRoute: RouterHelper.layout,
    );
  }
}
