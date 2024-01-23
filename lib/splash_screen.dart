import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thegourmandapp/route_helper.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  _LoadResource(){

  }
  @override
   void initState() {
    super.initState();
    _LoadResource();
    controller = new AnimationController(vsync: this, duration: Duration(seconds: 3))..forward();
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      Duration(seconds: 5), ()=>Get.offNamed(RouteHelper.getInitial())
    );
  }   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 280,),
              ScaleTransition(scale: animation),
              Center(child: Image.asset("chef.png", width: 250,))
            ],


          ),
        ),
      )
    );
  }
}


