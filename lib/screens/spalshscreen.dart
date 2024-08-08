// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:quizapp/models/userfunctions.dart';

 import 'package:quizapp/utility/routes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool isAdmin=false;
  dynamic data;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async{
      // await getAllDetails().then((value) => {
        Navigator.pushNamed(context, Routes.login);
      //   data=value,
      // });
      //  if(data==null)
      //   {
      //     setState((){
      //       isAdmin=true;
      //       print("isAdmin : $isAdmin");
      //     });
      //   }
      // isAdmin?Navigator.pushNamed(context, Routes.signup):Navigator.pushNamed(context, Routes.login);
      // print("value :$data\n isAdmin:$isAdmin");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
   
      child: Stack(
        children: [
          ColorFiltered(colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0.6),BlendMode.srcOver)),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.6),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/lgo.jpg",
                    ),
                    fit: BoxFit.cover)),
          ),
          const Positioned(
            top: 290,
            left: 60,
            child: CircleAvatar(
              radius: 140,
              backgroundImage: AssetImage("assets/images/quis.png"),backgroundColor: Color.fromARGB(255, 73, 10, 10),
            ),
          ),
        ],
      ),
    ));
  }
}
