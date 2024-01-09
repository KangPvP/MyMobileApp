import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {

  List<dynamic> users = [];

  static void fetchUsers() async {
    const url = 'https://randomuser.me/api/?resutlts=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
  }
}

//https://www.youtube.com/watch?v=ExPFnu8Dm40
//https://parse-dashboard.back4app.com/apps/7f6701ae-523a-4a1c-8adc-daecc8352320/connect