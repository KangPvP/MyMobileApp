import 'package:flutter/material.dart';
import 'package:flutter_app_3/models/category_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
    HomePage({super.key});
    List<CategoryModel> categories = [];

    void _getCategories() {
      categories = CategoryModel.getCategories();
    }

    @override
    Widget build(BuildContext context) {
      _getCategories();
      return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            SizedBox(height: 40,),
            _categoriesSection(),
        ]),
      );
    }

    Column _categoriesSection() {
      return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18, 
                    fontWeight: FontWeight.w600
                )),
              ),
              
              SizedBox(height: 20),
              Container(
                height: 120,
                child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 20,),
                  separatorBuilder: (context, index) => SizedBox(width: 25,),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(categories[index].iconPath)
                            ),
                          ),
                          Text(
                            categories[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ]
                      ),
                    ); //container == widget
                  },
                )
              )
            ],
          );
    }

    AppBar appBar() {
      return AppBar(
        title: const Text(
          'Breakfasts',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)
            ),

            child: SvgPicture.asset(
              'assets/icons/arrow-Left2.svg',
              height: 20,
              width: 20,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {

            },
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)
              ),

              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                height: 5,
                width: 5,
              ),
            ),
          ),
        ],
      );
    }
}

class _searchField extends StatelessWidget {
  const _searchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
            
          )
        ]
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true, 
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search Pancake',
          hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/icons/Search.svg')
            ),
          suffixIcon: Container( 
            width:100, 
            child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const VerticalDivider(
                  color: Colors.black, 
                  indent: 10, 
                  endIndent: 10, 
                  thickness: 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/Filter.svg')
                )
            ])
          )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }
}