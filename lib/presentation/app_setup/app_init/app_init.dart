// app_setup/app_init/app_init.dart
import 'package:flutter/material.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
