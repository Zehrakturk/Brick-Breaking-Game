import 'dart:math';

import 'package:flutter/material.dart';                     

const brickColors = [                                           
  Color.fromARGB(255, 227, 7, 7),
  Color.fromARGB(255, 9, 156, 229),
  Color.fromARGB(255, 225, 128, 9),
  Color.fromARGB(255, 217, 213, 6),
  Color.fromARGB(255, 7, 190, 13),
  // Color.fromARGB(255, 144, 4, 252),
  // Color.fromARGB(255, 248, 6, 216),
];

Color getRandomBrickColor() {
  final randomColorIndex = Random().nextInt(brickColors.length);
  return brickColors[randomColorIndex];
}


const gameWidth = 820.0;
const gameHeight = 1600.0;
const ballRadius = gameWidth * 0.02;     
const batWidth = gameWidth * 0.2;                               
const batHeight = ballRadius * 2;
const batStep = gameWidth * 0.05; 
const brickGutter = gameWidth * 0.015;                          
final brickWidth =
    (gameWidth - (brickGutter * (brickColors.length + 1)))
    / brickColors.length;
const brickHeight = gameHeight * 0.03;
const difficultyModifier = 1.03;