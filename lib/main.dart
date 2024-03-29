import 'package:apii/service_binding.dart';
import 'package:apii/theme.dart';
import 'package:apii/view/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init(); // Get Storage Initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dashy',
      theme: AppThemes.lightTheme, // theme class
      home: const SplashView(),
      initialBinding: ServicesBinder(), // initial binding
    );
  }
}
