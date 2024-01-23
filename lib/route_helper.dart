import 'package:get/get.dart';
import 'package:thegourmandapp/splash_screen.dart';
import 'package:thegourmandapp/welcome_screen.dart';

class RouteHelper{

  static const String splashPage= "/splash-page";
  static const String initial="/";

  static String getSpalshPage()=>'$splashPage';
  static String getInitial()=>'$initial';

  static List<GetPage>routes=[
    GetPage(name: splashPage, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=>WelcomeScreen()),
  ];
}