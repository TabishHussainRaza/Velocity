import 'package:ecommerece_velocity_app/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../enums.dart';
import 'components/body.dart';

class AddAddressScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

  const AddAddressScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "Add Address",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
