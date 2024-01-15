// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<User> welcomeFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String welcomeToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    DateTime? createdAt;
    String? name;
    String? avatar;
    String? adress;
    String? id;

    User({
        this.createdAt,
        this.name,
        this.avatar,
        this.adress,
        this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        adress: json["adress"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt!.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "adress": adress,
        "id": id,
    };
}
