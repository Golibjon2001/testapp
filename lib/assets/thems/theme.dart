import 'package:flutter/material.dart';
import 'package:testapp/assets/colors/colors.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: scaffoldBackground,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(fontSize: 15, color: green, fontWeight: FontWeight.w500),
        ),
      );
}
