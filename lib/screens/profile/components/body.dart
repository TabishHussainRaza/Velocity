import 'package:ecommerece_velocity_app/models/Customer.dart';
import 'package:ecommerece_velocity_app/screens/adresss/main_address.dart';
import 'package:ecommerece_velocity_app/screens/home/home_screen.dart';
import 'package:ecommerece_velocity_app/screens/orders/main_orders.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../complete_profile/complete_profile_screen.dart';
import '../../sign_in/sign_in_screen.dart';
import 'package:http/http.dart' as http;

import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  _ProfileBody createState() => _ProfileBody();
}
class _ProfileBody extends State<ProfileBody> {
  bool _isLoading = false;
  var errorMsg;

  late SharedPreferences sharedPreferences;
  late Customer CurrentCustomer;

  @override
  void initState() {
    super.initState();
  }

  loginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushNamed('/home');
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SignInPage()), (Route<dynamic> route) => true);
    }else{
    final name = sharedPreferences.getString('user') ?? '';
    print(name);
    CurrentCustomer = customerFromJson(name);}
  }

  @override
  Widget build(BuildContext context) {
    loginStatus();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.01),
          Text("My Profile", style: headingStyle),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => CompleteProfileScreen(CurrentCustomer: CurrentCustomer)), (Route<dynamic> route) => true)
            },
          ),
          ProfileMenu(
            text: "My Orders",
            icon: "assets/icons/order.svg",
            press: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const OrdersScreen()), (Route<dynamic> route) => true);
              },
          ),
          ProfileMenu(
            text: "My Address Book",
            icon: "assets/icons/book.svg",
            press: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const AddressScreen()), (Route<dynamic> route) => true);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              //logout();
              sharedPreferences.clear();
              sharedPreferences.commit();
              const snackBar = SnackBar(content: Text('Logout Successful'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);

            },
          ),
        ],
      ),
    );
  }

  logout() async {
    String url = serverUrl + "customer/logout";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });
        const snackBar = SnackBar(content: Text('Logged Out Successfully'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        sharedPreferences.clear();
        sharedPreferences.commit();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);

    }
    else {
      setState(() {
        _isLoading = false;
      });
      errorMsg = response.body;
      const snackBar = SnackBar(content: Text('Oops! Ran into some problem. Try again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
