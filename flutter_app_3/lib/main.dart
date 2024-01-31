import 'dart:convert';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

//import 'package:flutter_app_3/pages/home.dart';
//import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/mypage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//https://www.youtube.com/watch?v=NHlVuQpy8B4 App With backend 3h
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'QUlH5LjFbk8NRgDOiqTjZJ6S6WG5HV901jDfgtNn';
  const keyClientKey = 'm2lcsL6byn2H4YMK0mC2Tm3FftMffdcbrw3m2g5D';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, debug: true);

  var todoFlutter = ParseObject('TodoFlutter');
  todoFlutter.set('message', 'Hey ! First message From Flutter. Parse in now connected');
  todoFlutter.save();
  
  runApp(const ProviderScope(child: MyApp()));
  
}
void doCreateData() async {
  // Add Profile objects and create table
  var profile = ParseObject('Profile');
  profile.set('name', 'Adam Sandler');
  profile.set('birthDay', DateTime.parse('1966-09-09'));
  profile.set('friendCount', 2);
  profile.set('favoriteFoods', ['Lobster', 'Bread']);
  await profile.save();

  profile = ParseObject('Profile');
  profile.set('name', 'Adam Levine');
  profile.set('birthDay', DateTime.parse('1979-03-18'));
  profile.set('friendCount', 52);
  profile.set('favoriteFoods', ['Cake', 'Bread']);
  await profile.save();

  profile = ParseObject('Profile');
  profile.set('name', 'Carson Kressley');
  profile.set('birthDay', DateTime.parse('1969-11-11'));
  profile.set('friendCount', 12);
  profile.set('favoriteFoods', ['Fish', 'Cookies']);
  await profile.save();

  profile = ParseObject('Profile');
  profile.set('name', 'Dan Aykroyd');
  profile.set('birthDay', DateTime.parse('1952-07-01'));
  profile.set('friendCount', 66);
  profile.set('favoriteFoods', ['Jam', 'Peanut Butter']);
  await profile.save();

  profile = ParseObject('Profile');
  profile.set('name', 'Eddie Murphy');
  profile.set('birthDay', DateTime.parse('1961-04-03'));
  profile.set('friendCount', 49);
  profile.set('favoriteFoods', ['Lettuce', 'Pepper']);
  await profile.save();

  profile = ParseObject('Profile');
  profile.set('name', 'Fergie');
  profile.set('birthDay', DateTime.parse('1975-03-27'));
  profile.set('friendCount', 55);
  profile.set('favoriteFoods', ['Lobster', 'Shrimp']);
  await profile.save();
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






