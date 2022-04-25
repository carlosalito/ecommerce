import 'package:e_commerce_desafio/infra/constants/named_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        Navigator.of(context).pushReplacementNamed(NamedRoutes.pageNavigator);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SizedBox(child: Center(child: Text('Splash Screen'))));
  }
}
