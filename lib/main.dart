import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shak_bespoke/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: " App",
      initialRoute: Approute.getSplashScreen(),
      getPages: Approute.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 117, 56, 220)),
      ),
    );
  }
}
