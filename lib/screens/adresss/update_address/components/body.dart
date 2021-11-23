import 'package:ecommerece_velocity_app/models/address.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

import 'address_form.dart';

class Body extends StatefulWidget {
  Address AddressID;
  Body({Key? key, required this.AddressID}) : super(key: key);

  @override
  BodyContent createState() => BodyContent();
}
class BodyContent extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Update Address", style: headingStyle),
                const Text(
                  "Change the following fields to update.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                UpdateAddressForm(AddressID: widget.AddressID),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

