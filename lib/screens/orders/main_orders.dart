import 'package:ecommerece_velocity_app/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../enums.dart';
import 'components/body.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = "/orders";
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body:OrderBody(),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "My Orders",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

}
