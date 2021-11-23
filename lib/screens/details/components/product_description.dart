import 'package:flutter/material.dart';
import 'package:ecommerece_velocity_app/models/products.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  /**
   * DefaultButton(
      text: "Add To Cart",
      press: () {},
      ),
   */

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(18),
            top: getProportionateScreenWidth(5),
          ),
          child: Text(
            product.name,
            style: new TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(18),
                        top: getProportionateScreenWidth(5),
                      ),
                      child:
                      Row(
                        children: [
                          if (product.inStock)  Text("In Stock (" + product.totalQuantity.toString() +" Left)" , style: TextStyle(fontSize: 18.0, color: Colors.green,fontWeight: FontWeight.w800,) ) else Text("Out of Stock (" + product.totalQuantity.toString() +" Left)" , style: TextStyle(fontSize: 18.0, color: Colors.red, fontWeight: FontWeight.w800,),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),

      ],
    );
  }
}


