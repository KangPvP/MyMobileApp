import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  bool isSwitch = false;
  bool? isCheckBox = false;
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
            icon: const Icon(Icons.arrow_back_rounded)
          ),
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
