import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(name: 'Honey', iconPath: 'assets/icons/honney-pancakes.svg', boxColor: Color(0xff92A3FD))
    );
    categories.add(
      CategoryModel(name: 'Natural', iconPath: 'assets/icons/pancakes.svg', boxColor: Color(0xffC58BF2))
    );
    categories.add(
      CategoryModel(name: 'Blueberry', iconPath: 'assets/icons/blueberry-pancakes.svg', boxColor: Color(0xffC58BF2))
    );
    categories.add(
      CategoryModel(name: 'Blueberry', iconPath: 'assets/icons/blueberry-pancakes.svg', boxColor: Color(0xffC58BF2))
    );
    categories.add(
      CategoryModel(name: 'Blueberry', iconPath: 'assets/icons/blueberry-pancakes.svg', boxColor: Color(0xffC58BF2))
    );
    categories.add(
      CategoryModel(name: 'Blueberry', iconPath: 'assets/icons/blueberry-pancakes.svg', boxColor: Color(0xffC58BF2))
    );



    return categories;
  }
  
}