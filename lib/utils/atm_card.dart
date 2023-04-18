import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

class CountyCard extends StatefulWidget {
  int index = 0;
  CountyCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CountyCard> createState() => _CountyCardState();
}

class _CountyCardState extends State<CountyCard> {
  // used this color list to define the length of the container, not sure why but i did
  // guess that's my
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.teal
  ];

  final List<String> _cardNames = [
    'Akanbi Ayodeji',
    'Ogunjinmi Seyi',
    'Adedolapo Ayotomiwa',
    'Galaxy tunde',
    'Handboss jay',
    'Skillful joe',
    'Cassamigo craze',
    'ninja serty',
  ];

  final List<String> _cardBalance = [
    'XXXX XXXX XXXX XXXX',
    'XXXX XXXX XXXX XXXX',
    'XXXX XXXX XXXX XXXX',
    'XXXX XXXX XXXX XXXX',
    'XXXX XXXX XXXX XXXX',
    'XXXX XXXX XXXX XXXX',
    'XXXX XXXX XXXX XXXX',
    'XXXX XXXX XXXX XXXX',
  ];
  int _selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                for (var i = 0; i < _colors.length; i++)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    top: _selectedCardIndex == i ? 90 : 200,
                    left: i * 10.0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCardIndex = i;
                          _colors.insert(0, _colors.removeAt(i));
                          _cardNames.insert(0, _cardNames.removeAt(i));
                          _cardBalance.insert(0, _cardBalance.removeAt(i));
                        });
                      },
                      child: Transform.rotate(
                        angle: pi / 100 * 10 / 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(-5, -5),
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(5, 5),
                              ),
                            ],
                          ),
                          height: 200,
                          width: 300,
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          _cardNames[i],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 223, 201, 115)),
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          _cardBalance[i],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 23, 23, 23)),
                                        ),
                                      )
                                    ],
                                  ))),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
