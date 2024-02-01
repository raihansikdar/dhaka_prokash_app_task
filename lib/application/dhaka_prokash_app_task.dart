import 'package:dhaka_prokash_app_task/application/state_holder_binder.dart';
import 'package:dhaka_prokash_app_task/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DhakaProkashAppTask extends StatelessWidget {
  const DhakaProkashAppTask({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "NotoSans",
      ),
      home: const HomeScreen(),
    );
  }
}