// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:concentric_transition/concentric_transition.dart';

import 'package:lottie/lottie.dart';

class MyConcentricTransition extends StatefulWidget {
  const MyConcentricTransition({Key? key}) : super(key: key);

  @override
  _MyConcentricTransitionState createState() => _MyConcentricTransitionState();
}

class _MyConcentricTransitionState extends State<MyConcentricTransition> {
  final List<Map<String, dynamic>> lottieData = [
    {
      'asset': 'assets/travel.json',
      'text': 'Find\nYour Perfect\nPlace To Stay!',
      'textColor': Colors.black
    },
    {
      'asset': 'assets/bookingg.json',
      'text': 'Book\nAppointment\nin Easiest Way',
      'textColor': Colors.black
    },
    {
      'asset': 'assets/explore.json',
      'text': 'Explore\nThe Beautiful\nWorld!',
      'textColor': Colors.white
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Container(
            child: ConcentricPageView(
              radius: 40,
              verticalPosition: 0.85,
              colors: [Color(0xFFF0DCC3), Colors.white, Colors.blue],
              nextButtonBuilder: (context) => Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Icon(Icons.navigate_next, size: 30),
              ),
              itemBuilder: (index) {
                final data = lottieData[index % lottieData.length];

                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 200),
                      Center(
                        child: Lottie.asset(
                          data['asset'],
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          data['text'],
                          style: TextStyle(
                            color: data['textColor'],
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: TextButton(
              onPressed: () {
                // Implement skip logic here
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontFamily: 'Exo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
