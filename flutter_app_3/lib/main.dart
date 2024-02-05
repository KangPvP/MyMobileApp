import 'dart:convert';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

//import 'package:flutter_app_3/pages/home.dart';
//import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/mypage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//https://www.youtube.com/watch?v=NHlVuQpy8B4 App With backend 3h
void main() {
  
  runApp(const ProviderScope(child: MyApp()));
      ////
    // 1.  Listen to events (See docs for all 12 available events).
    //

    // Fired whenever a location is recorded
    bg.BackgroundGeolocation.onLocation((bg.Location location) {
      var coords_lat = location.coords.latitude.toString(); 
      var coords_lon = location.coords.longitude.toString(); 
      print('[location] - $coords_lat  ||  $coords_lon');
      print('[location] - $location');
    });

    // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
    bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
      print('[motionchange] - $location');
    });

    // Fired whenever the state of location-services changes.  Always fired at boot
    bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
      print('[providerchange] - $event');
    });

    ////
    // 2.  Configure the plugin
    //
    bg.BackgroundGeolocation.ready(bg.Config(

        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 10.0,
        stopOnTerminate: false,
        startOnBoot: true,
        //enableHeadless: true,
        debug: true,
        logLevel: bg.Config.LOG_LEVEL_VERBOSE
    )).then((bg.State state) {
      if (!state.enabled) {
        ////
        // 3.  Start the plugin.
        //
        bg.BackgroundGeolocation.start();
      }
    });
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






