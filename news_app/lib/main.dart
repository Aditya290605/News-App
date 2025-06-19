import 'package:flutter/material.dart';
import 'package:news_app/splash_screen.dart';

void main (){
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget{

  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {

  bool isLight = true;

  void setTheme(bool val){
    setState(() {
      isLight = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isLight ?
      ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        ),
        textTheme: const TextTheme(

          bodyMedium: TextStyle(
            fontFamily: "Lato",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          bodySmall: TextStyle(
            fontFamily: "Lato",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          bodyLarge: TextStyle(
            fontFamily: "Lato",
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          titleLarge: TextStyle(
            fontFamily: "Lato",
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,

      ):
      ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white
        ),
        textTheme: const TextTheme(

          bodyMedium: TextStyle(
            fontFamily: "Lato",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

          bodySmall: TextStyle(
            fontFamily: "Lato",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

          bodyLarge: TextStyle(
            fontFamily: "Lato",
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),

          titleLarge: TextStyle(
            fontFamily: "Lato",
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
        ),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(
       
      ),
    );
  }
}