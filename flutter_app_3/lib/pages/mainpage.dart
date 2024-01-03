import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/learnpage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){ // Function for load the new page
                return const LearnPage();
              }
            ),
          );
        },
        child: const Text('Learn Flutter')
      )
    );
  }
}