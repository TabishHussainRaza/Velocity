import 'package:ecommerece_velocity_app/components/coustom_bottom_nav_bar.dart';
import 'package:ecommerece_velocity_app/models/orders.dart';
import '../../../models/address.dart';
import 'package:flutter/material.dart';

import '../../../enums.dart';
import 'components/body.dart';

class ViewOrderScreen extends StatelessWidget {
  Order MyOrder;
  static String routeName = "/updateAddressScreen";

  ViewOrderScreen({Key? key, required this.MyOrder}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(MyOrder: MyOrder),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "View my Order",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
