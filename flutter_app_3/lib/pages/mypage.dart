import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_app_3/pages/home.dart";
import "package:flutter_app_3/pages/mainpage.dart";
import "package:flutter_app_3/pages/profilpage.dart";
import 'package:http/http.dart' as http;

class MyPage extends StatelessWidget {
  MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Karsog Title"),
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    MainPage(),
    ProfilPage()
  ];
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Course'),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
          print(users);
        },
        child: const Icon(Icons.add_alert_sharp),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
      void fetchUsers() async {
        const url = 'https://randomuser.me/api/?resutlts=10';
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        setState((){
          users = json['results'];
        });

    }

}
