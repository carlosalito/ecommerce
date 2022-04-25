import 'package:e_commerce_desafio/di/injectable.dart' as di;
import 'package:e_commerce_desafio/presentation/app/app_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const AppWidget());
}
