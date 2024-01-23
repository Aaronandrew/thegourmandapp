import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:thegourmandapp/login_screen.dart';
import 'package:thegourmandapp/show_custom_snackbar.dart';
import 'rounded_button.dart';

//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(

);

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String FirstName;
  late String LastName;
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

      if(FirstName.trim().isEmpty ) {
        showCustomSnackBar("Enter First Name", title: "First Name");
      }else if(LastName.trim().isEmpty ) {
        showCustomSnackBar("Enter Last Name", title: "Last Name");
      }else if(!GetUtils.isEmail(email.trim())) {
        showCustomSnackBar("Invalid Email", title: "Email");
      } else if (password.trim().isEmpty) {
        showCustomSnackBar("Enter Password", title: "Password");
      } else {
        showCustomSnackBar("Must Have special Character..!@#." +'\n'+
            "Must be 6 Characters." + '\n' + "Must have a number." + '\n'+ "Must have an uppercase letter.", title: "Password");
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ProgressHUD(
         //inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                //SizedBox(height: 150,),
              RichText(
                text:TextSpan(
                  text: "Hello, Sign Up Today!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize:20
                  ),),

              ),
                SizedBox(height: 30,),
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
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        FirstName = value;
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          border: InputBorder.none,
                          hintText: 'First Name',
                        prefixIcon: Icon(Icons.person, color: Colors.orangeAccent,)
                      )),
                ),
                SizedBox(
                  height: 15.0,
                ),
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
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        LastName = value;
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                          prefixIcon: Icon(Icons.person, color: Colors.orangeAccent,)
                      )),
                ),
                SizedBox(
                  height: 15.0,
                ),
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
                      )),
                ),
                SizedBox(
                  height: 15.0,
                ),
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
                      obscureText: _isHidden,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        password = value;
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          border: InputBorder.none,
                          hintText: 'Create Password',
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,color: Colors.grey,
                            ),
                          ),
                          prefixIcon: Icon(Icons.password, color: Colors.orangeAccent,)
                      )),
                ),
                SizedBox(
                  height: 15.0,
                ),
                RoundedButton(
                  colour: Colors.orangeAccent,
                  title: 'Register',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, 'home_screen');
                      }
                    }
                    catch (e) {
                     // print(e);
                      _registration();
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                ),
                SizedBox(height: 4,),
                RichText(
                    text:TextSpan(
                      text: "Have an account already? ",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize:20
                      ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>LoginScreen()),
                            text: "Sign In",
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