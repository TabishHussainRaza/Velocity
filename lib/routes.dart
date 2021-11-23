import 'package:ecommerece_velocity_app/screens/more_content/Report_a_bug_form/report_a_bug.dart';
import 'package:ecommerece_velocity_app/screens/more_content/contact_us_form/contact_us.dart';
import 'package:ecommerece_velocity_app/screens/more_content/feedback_form/feedback_form.dart';
import 'package:ecommerece_velocity_app/screens/more_content/settings_page.dart';
import 'package:ecommerece_velocity_app/screens/payment/components/existing_card.dart';
import 'package:ecommerece_velocity_app/screens/payment/payment_homepage.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerece_velocity_app/screens/cart/cart_screen.dart';
import 'package:ecommerece_velocity_app/screens/details/details_screen.dart';
import 'package:ecommerece_velocity_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerece_velocity_app/screens/home/home_screen.dart';
import 'package:ecommerece_velocity_app/screens/login_success/login_success_screen.dart';
import 'package:ecommerece_velocity_app/screens/otp/otp_screen.dart';
import 'package:ecommerece_velocity_app/screens/profile/profile_screen.dart';
import 'package:ecommerece_velocity_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerece_velocity_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInPage.routeName: (context) => SignInPage(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  //CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SettingsPage.routeName:(context) => const SettingsPage(),
  ContactForm.routeName:(context) => const ContactForm(),
  ReportABug.routeName:(context) => const ReportABug(),
  FeedBack.routeName:(context) => const FeedBack(),
  PaymentPage.routeName: (context) => PaymentPage(),
  ExistingCardPage.routeName: (context) => ExistingCardPage(),
};
