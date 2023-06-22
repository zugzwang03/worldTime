// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    bool isMapEmpty = data.isEmpty;
    if (isMapEmpty) {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }
    print(data);

    String bgImage = data['isDayTime'] ? 'day.webp' : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/chooseLocation');
                    if (result != null) {
                      setState(() {
                        data = result;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Color.fromARGB(255, 30, 10, 10)),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          letterSpacing: 2.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(color: Colors.black, fontSize: 66.0),
                )
              ],
            ),
          ),
        )));
  }
}
