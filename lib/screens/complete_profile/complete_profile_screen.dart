import 'package:ecommerece_velocity_app/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerece_velocity_app/models/Customer.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  Customer CurrentCustomer;
  static String routeName = "/complete_profile";

  CompleteProfileScreen({Key? key, required this.CurrentCustomer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(CurrentCustomer: CurrentCustomer,),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "My Profile",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
