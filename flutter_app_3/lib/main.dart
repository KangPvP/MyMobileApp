import 'dart:convert';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

//import 'package:flutter_app_3/pages/home.dart';
//import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/mypage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//https://www.youtube.com/watch?v=NHlVuQpy8B4 App With backend 3h
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'QUlH5LjFbk8NRgDOiqTjZJ6S6WG5HV901jDfgtNn';
  const keyClientKey = 'm2lcsL6byn2H4YMK0mC2Tm3FftMffdcbrw3m2g5D';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, autoSendSessionId: true);
  

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






