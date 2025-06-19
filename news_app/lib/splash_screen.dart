import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/news_screen.dart';


class SplashScreen extends StatefulWidget {


  const SplashScreen({super.key,

  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5),
    (){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_)=> const NewsScreen(
           
          ),
          )
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.lightBlue],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/1759492.png",
          height: 250,
          width: 350,),

          const SizedBox(height: 20,),

          Text("Welcome to \n  News App",
          style: Theme.of(context).textTheme.bodyLarge
          )
        ],
      ),
    );
  }
}