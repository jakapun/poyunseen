import 'package:flutter/material.dart';
// import 'package:poyunseen/screens/my_home.dart';
import 'package:poyunseen/screens/my_service.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyService(),); // เรียกใช้ my_service ที่สร้าง
  }
}