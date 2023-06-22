// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:worldmap/pages/choose_location.dart';
import 'package:worldmap/pages/loading.dart';
import 'pages/home.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/chooseLocation" : (context) => ChooseLocation()
    },
  ));
}