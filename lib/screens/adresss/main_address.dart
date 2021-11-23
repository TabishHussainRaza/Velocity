import 'package:ecommerece_velocity_app/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../enums.dart';
import 'components/body.dart';
import 'create_address/add_adress.dart';

class AddressScreen extends StatelessWidget {
  static String routeName = "/address";
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body:const AddressBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const AddAddressScreen()), (Route<dynamic> route) => true);
          },
          tooltip: 'Add Address',
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF00821E),
          focusColor: const Color(0xFF00821E),
          foregroundColor: const Color(0xFFFFFFFF),
          hoverColor: const Color(0xFFFF7643),
          splashColor: const Color(0xFFFF7643),
        ),
        bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile));
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "Address Book",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
