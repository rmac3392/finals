import 'package:finals/ChoicesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ChoicesController controller = Get.put(ChoicesController());
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
