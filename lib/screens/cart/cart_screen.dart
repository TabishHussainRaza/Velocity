import 'package:flutter/material.dart';
import 'package:ecommerece_velocity_app/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  double total = 0;
  @override
  Widget build(BuildContext context) {
    for( var i = 0 ; i < demoCarts.length; i++) {
      total = total +  double.parse(demoCarts[i].product.price) * demoCarts[i].numOfItem;
    }

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(total: total),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
