import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_crud_6sia3/pages/user_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX API CRUD',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.teal, foregroundColor: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.teal), foregroundColor: WidgetStatePropertyAll(Colors.white)),
        ),
      ),
      home: UserListPage(),
    );
  }
}
