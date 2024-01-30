import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_app_3/pages/mainpage.dart';
import 'package:flutter_app_3/pages/mypage.dart';
import 'package:flutter_app_3/utils/country_code_pick.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;


class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {

  @override
  void initState() {
    super.initState();

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


  bool isSwitch = false;
  bool? isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Learn Flutter'),
          /*automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              
              //Navigator.of(context)
                  .pop(); //Supprimé la vu de la page actuel, pour voir celle du dessous
            },
            icon: const Icon(Icons.arrow_back_rounded)
          ),*/
          actions: [
            IconButton(onPressed: ()=> debugPrint('Actions'), icon: const Icon(Icons.info_outline))
          ],
        
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/Albert_einstein.jpg'),
              const SizedBox(height: 40),
              const Divider(),
              Container(
                color: Colors.blueGrey,
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                /*               decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 4.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10),
                ), */
                child: const Text('This is a text Widget',
                    style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSwitch ? Colors.green : Colors.blue
                ),
                onPressed: () {
                  debugPrint('Elevated Button');
                },
                child: const Text('Elevated Button')
              ),
          
              OutlinedButton(
                  onPressed: () {
                    debugPrint('Outlined Button');
                  },
                  child: const Text('Outlined Button')),
              TextButton(
                  onPressed: () {
                    debugPrint('Text Button');
                  },
                  child: const Text('Text Button')),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  debugPrint('This is the row');
                },
                
                child: const Row(
                    
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_fire_department,color: Colors.red),
                    Text('Row widgt'),
                    Icon(Icons.local_fire_department)
                  ],
                ),
              ),
              Switch(value: isSwitch, onChanged: (bool newBool){
                setState(() {
                  isSwitch = newBool;
                });
              }),
              Checkbox(value: isCheckBox, onChanged: (bool? newBool){
                  setState(() {
                    isCheckBox = newBool;
                  });
              })
            ],
          ),
        ));
  }




}
