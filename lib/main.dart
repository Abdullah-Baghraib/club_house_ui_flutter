import 'package:clubhouse_ui_clone/const.dart';
import 'package:clubhouse_ui_clone/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      title: "Clubhouse UI",
      theme: ThemeData
      (
        appBarTheme: AppBarTheme(backgroundColor: kbackgroundColor),
        scaffoldBackgroundColor: kbackgroundColor,
        primaryColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
        
      ),
      home:  HomePage()
      
    );
  }
}