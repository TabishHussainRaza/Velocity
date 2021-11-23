import 'package:ecommerece_velocity_app/components/coustom_bottom_nav_bar.dart';
import '../../../models/address.dart';
import 'package:flutter/material.dart';

import '../../../enums.dart';
import 'components/body.dart';

class UpdateAddressScreen extends StatelessWidget {
  Address AddressID;
  static String routeName = "/updateAddressScreen";

  UpdateAddressScreen({Key? key, required this.AddressID}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(AddressID: AddressID),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "View Address",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
