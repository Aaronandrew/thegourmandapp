


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:thegourmandapp/show_custom_snackbar.dart';
import 'signup_screen.dart';
import 'rounded_button.dart';

import 'package:flutter/material.dart';

//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(
   // hintText: 'Enter a value',
   //hintStyle: TextStyle(color: Colors.black),
   /* contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    )*/);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  bool showSpinner = false;
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {

    void _togglePasswordView() {
      setState(() {
        _isHidden = !_isHidden;
      });
    }
     void _registration() {
      // String email = email.trim();

      if (!GetUtils.isEmail(email.trim())) {
        showCustomSnackBar("Invalid Email", title: "Email");
      } else if (password.trim().isEmpty) {
        showCustomSnackBar("Invalid Password", title: "Password");
      } else  {
        showCustomSnackBar("Invalid Email or Password ");
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
       body: SingleChildScrollView(
         physics: BouncingScrollPhysics(),
         child: Container(
           //margin: EdgeInsets.only(left:20,right: 20),

         //  height: .005, width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
               // mainAxisSize: MainAxisSize.max,
               //mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 150,),
                Center(
                   child: CircleAvatar(
                     backgroundColor: Colors.white,
                     radius: 80,
                     backgroundImage: AssetImage("chef.png"),
                   ),

                ),
                RichText(
                  text:TextSpan(
                    text: "Welcome Back Food Lover!",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize:20
                    ),),

                ),
                SizedBox(height: 25,),
                Container(//SizedBox(height: 150,),
                  margin: EdgeInsets.only(left:20,right: 20),
                  decoration: BoxDecoration(color:Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1,10),
                            color: Colors.grey.withOpacity(0.4)
                        )
                      ]),
                 child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      border: InputBorder.none,
                      hintText: 'Email/Username',
                      prefixIcon: Icon(Icons.email, color: Colors.orangeAccent,)
                    )),),
                 SizedBox(height: 15,),
               Container(
                 margin: EdgeInsets.only(left:20,right: 20),
                 decoration: BoxDecoration(color:Colors.white,
                     borderRadius: BorderRadius.circular(30),
                     boxShadow: [
                       BoxShadow(
                           blurRadius: 10,
                           spreadRadius: 7,
                           offset: Offset(1,10),
                           color: Colors.grey.withOpacity(0.4)
                       )
                     ]),
                 child: TextField(
                    // style: TextStyle(height:2 ),
                      obscureText: _isHidden,
                      textAlign: TextAlign.left,

                      onChanged: (value) {
                        password = value;
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          border: InputBorder.none,
                          hintText: 'Password',
                        suffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,color: Colors.grey,
                          ),
                        ),
                          prefixIcon: Icon(Icons.password, color: Colors.orangeAccent,),


                      )),
               ),

                RoundedButton(
                    colour: Colors.orangeAccent,
                    title: 'Log In',
                    onPressed: () async {

                      setState(() {
                        showSpinner = true;

                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        if (user != null) {
                          Navigator.pushNamed(context, 'home_screen');
                        }
                      } catch (e) {
                        _registration();

                    }}),
                RichText(
                  text:TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize:20
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>RegistrationScreen()),
                        text: "Create",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize:18,
                          fontWeight:FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),

                      )
                    ],
                  ),

                )
                ],
            ),
          ),
      ),
       ),
     );
  }
}