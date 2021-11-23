import 'package:ecommerece_velocity_app/models/Customer.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatefulWidget {
  Customer CurrentCustomer;
  Body({Key? key, required this.CurrentCustomer}) : super(key: key);

  @override
  BodyContent createState() => BodyContent();
}

class  BodyContent extends State<Body>{

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
                Text("Update your Profile", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                CompleteProfileForm(CurrentCustomer: widget.CurrentCustomer),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
