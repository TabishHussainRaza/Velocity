import 'package:ecommerece_velocity_app/components/default_button.dart';
import 'package:ecommerece_velocity_app/models/products.dart';
import 'package:ecommerece_velocity_app/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class AddCart extends StatefulWidget {
  final Product product;

  const AddCart({Key? key, required this.product}) : super(key: key);

  @override
  AddCard createState() => AddCard();
}

class AddCard extends State<AddCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(250),
                  child: DefaultButton(
                    text: "Add to Cart",
                    press: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => CartScreen()),
                          (Route<dynamic> route) => true);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
