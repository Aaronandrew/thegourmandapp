import 'package:flutter/material.dart';
import 'rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //width: 250.0,
        //height: 25.0,
       // alignment: Alignment.center,
     // constraints: const BoxConstraints.expand(),
    //    decoration: const BoxDecoration(
     //       image: DecorationImage(
       //         image: AssetImage("homescreen.jpeg"), alignment: Alignment.center,
              //Height: double.infinity,
             // width: double.infinity,
       //       fit: BoxFit.fill, )),
    body: SizedBox(
      child: Container(
        constraints: const BoxConstraints.expand(),
           decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("homescreen.jpeg" ), //alignment: Alignment.center,
        //Height: double.infinity,
        // width: double.infinity,
             fit: BoxFit.cover, )),
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(

                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 150,),

                    Text(
                      "Gourmand",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 54.0,
                        fontFamily: "Caveat",
                        fontWeight: FontWeight.w700,
                       // height: -5,
                      ),),
                    Text(
                      """ "Fine Dining To Go" """,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                          fontFamily: "Caveat",
                          fontWeight: FontWeight.w500,
                         // height: -11,
                      ),),
                    SizedBox(height: 300,),
                      RoundedButton(
                      colour: Colors.orangeAccent,

                      title: 'Log In',
                      onPressed: () {
                        Navigator.pushNamed(context, 'login_screen');
                      },
                    ),
                    RoundedButton(
                        colour: Colors.orangeAccent,
                        title: 'Sign Up',
                        onPressed: () {
                          Navigator.pushNamed(context, 'registration_screen');
                        }),
                  ]),
            ),
          ),    ),
    ));
  }
}