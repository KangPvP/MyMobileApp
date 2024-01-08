import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?resutlts=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
  }  
}

//https://www.youtube.com/watch?v=ExPFnu8Dm40