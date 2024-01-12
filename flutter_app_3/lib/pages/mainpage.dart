import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/learnpage.dart';
import 'package:flutter_app_3/pages/mypage.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var hellovar = MyVariable.users;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: hellovar.length,
      separatorBuilder: (context, index) => SizedBox(width: 25,),
      itemBuilder: (context, index){
        print(hellovar.length);
        final user = hellovar[index];
        final email = user['email'];
        return ListTile(
          leading: Text('$index'),
          title: Text(email),
        );
    });
  }
}

