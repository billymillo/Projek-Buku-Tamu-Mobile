import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/models/colorpalette.dart';
import 'package:mobile/routes/appPages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: PrimaryColor().blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}