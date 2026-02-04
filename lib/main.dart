import 'package:flutter/material.dart';
import 'package:flutter_calculator/screens/landscape_layout.dart';
import 'package:flutter_calculator/screens/potrait_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(),debugShowCheckedModeBanner: false,);
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context,orientation){
          return orientation == Orientation.portrait? PortraitLayout()
              :LandscapeLayout();

        }
    );
  }
}
