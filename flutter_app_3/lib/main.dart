import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter_app_3/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/mypage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.green,
      ),
      
      //home: HomePage(),
      home: const RootPage(),

    );
  }



}






