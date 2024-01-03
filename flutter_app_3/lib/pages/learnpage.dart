import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: const Text('Learn Flutter'),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); //Supprimé la vu de la page actuel, pour voir celle du dessous
                },
                icon: const Icon(Icons.arrow_back_rounded))),
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
                onPressed: () {
                  debugPrint('Elevated Button');
                },
                child: const Text('Elevated Button')
              ),
          
              OutlinedButton(
                onPressed: () {
                  debugPrint('Outlined Button');
                },
                child: const Text('Outlined Button')
              ),
              
            ],
          ),
        ));
  }
}
