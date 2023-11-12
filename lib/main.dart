import 'package:flutter/material.dart';
import 'package:testapp/assets/thems/theme.dart';
import 'package:testapp/core/singeltons/service_locator.dart';
import 'package:testapp/features/home/presentation/pages/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: AppTheme.theme(),
      home: const UserScreen(),
    );
  }
}
