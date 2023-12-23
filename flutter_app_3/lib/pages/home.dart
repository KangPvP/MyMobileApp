import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key});

    static const String svgString = '''
    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
    <g id="Iconly/Light/Arrow - Left 2">
    <g id="Arrow - Left 2">
    <path id="Stroke 1" d="M10.3334 12.6668L5.66671 8.00016L10.3334 3.3335" stroke="#1D1617" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
    </g>
    </g>
    </svg>''';

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top:40, left: 20, right: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1D1617).withOpacity(0.11),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  )),
              ),
            ),
        ]),
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