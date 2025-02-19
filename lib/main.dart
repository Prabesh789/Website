// main.dart
import 'package:flutter/material.dart';
import 'package:portfolio_web/presentation/app_setup/app_init/app_init.dart';
import 'package:portfolio_web/presentation/my_app/my_app.dart';

void main() async {
  await AppInit.initialize();
  runApp(const MyApp());
}
