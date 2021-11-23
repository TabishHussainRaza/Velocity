import 'dart:convert';

import 'package:async/async.dart';
import 'package:ecommerece_velocity_app/components/default_button.dart';
import 'package:ecommerece_velocity_app/components/rounded_icon_btn.dart';
import 'package:ecommerece_velocity_app/models/Cart.dart';
import 'package:ecommerece_velocity_app/models/oneProduct.dart' as OP;
import 'package:ecommerece_velocity_app/models/products.dart';
import 'package:ecommerece_velocity_app/screens/cart/cart_screen.dart';
import 'package:ecommerece_velocity_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

import '../../../constants.dart';
import 'product_description.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  BodyContent createState() => BodyContent();
}

class BodyContent extends State<Body> {
  int quantity = 1;
  late Product CorrectProduct;

  final _closeMemo = AsyncMemoizer();

  increment_quantity() {
    setState(() {
      if(quantity< CorrectProduct.totalQuantity){
        quantity++;
      }

    });
  }

  decrement_quantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }else if(CorrectProduct.totalQuantity ==0){
        quantity = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              //child:
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    value: snapshot.data,
                    semanticsLabel: 'Progress indicator',
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const Text(
                    'Please wait while it is loading.. ',
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                //child:
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'Oops', style: TextStyle(fontSize: getProportionateScreenWidth(35),fontWeight: FontWeight.w800),),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            Text(
                                'Looks like something went wrong',
                                style: TextStyle(fontSize: getProportionateScreenWidth(15))),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              );
            } else if (snapshot.hasData == true) {
             // initState();
              if(CorrectProduct.totalQuantity ==0){
                  quantity = 0;
              }
              return ListView(
                children: [
                  ProductImages(product: CorrectProduct),
                  ProductDescription(
                    product: CorrectProduct,
                    pressOnSeeMore: () {},
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
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
                                  left: getProportionateScreenWidth(15),
                                  top: getProportionateScreenWidth(10),
                                ),
                                child: Text(CorrectProduct.formatedPrice,
                                    textAlign: TextAlign.justify,
                                    style: new TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(15)),
                                  decoration: BoxDecoration(
                                    color: CorrectProduct.isWishlisted
                                        ? Color(0xFFFFE6E6)
                                        : Color(0xFFF5F6F9),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Tooltip(
                                        message: 'Decrease Quantity',
                                        child: RoundedIconBtn(
                                            icon: Icons.remove,
                                            showShadow: true,
                                            press: () {
                                              decrement_quantity();
                                            },
                                          ),
                                        ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(25)),
                                      Text("$quantity"),

                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(25)),
                                      Tooltip(
                                        message: 'Increase Quantity',
                                        child: RoundedIconBtn(
                                          icon: Icons.add,
                                          showShadow: true,
                                          press: () {
                                            increment_quantity();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(15),
                        top: getProportionateScreenWidth(20),
                        right: getProportionateScreenWidth(15)),
                    child: Tooltip(
                      message: 'Adds the product to Cart',
                      child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            demoCarts.add(
                              Cart(product: widget.product, numOfItem: quantity)
                            );

                            const snackBar = SnackBar(content: Text('Added to Cart'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CartScreen()),
                                    (Route<dynamic> route) => true);
                          },
                          condition: CorrectProduct.inStock
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(10),
                      right: getProportionateScreenWidth(10),
                      bottom: getProportionateScreenWidth(15),
                      top: getProportionateScreenWidth(20),
                    ),
                    child: SingleChildScrollView(
                      child: Html(
                        data: CorrectProduct.description ,
                        style: {
                          "table": Style(
                            width: double.maxFinite
                            ),
                          "tr": Style(
                            border: Border(bottom: BorderSide(color: Colors.grey),
                                top: BorderSide(color: Colors.grey),
                                left: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey)


                            ),
                          ),
                          "th": Style(
                            padding: EdgeInsets.all(6),
                            backgroundColor: Colors.grey,
                          ),
                          "td": Style(
                            padding: EdgeInsets.all(6),
                          ),
                          'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                        },
                        customRender: {
                          "table": (contextT, child) {
                            return Container(
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child:
                                (contextT.tree as TableLayoutElement).toWidget(contextT),
                              )
                            );
                          },
                        },
                        onCssParseError: (css, messages) {
                          print("css that errored: $css");
                          print("error messages:");
                          messages.forEach((element) {
                            print(element);
                          });
                        },
                      ),
                    ),),
                  SizedBox(width: getProportionateScreenWidth(50)),

                ],

              );
            } else {
              return Center(
                //child:
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              'Oops',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(35),
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            Text('Looks like something went wrong',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(15))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  getProduct() {
    return this._closeMemo.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      var id = widget.product.id;
      String url = serverUrl + "products/$id";
      try{
        var response = await http.get(Uri.parse(url), headers: {
          'Content-Type': 'application/json',
          'Connection': 'keep-alive',
        });
        if (response.statusCode == 200) {
          var jsonResponse = await json.decode(response.body);
          if (jsonResponse != null) {
            CorrectProduct = OP.productFromJson(response.body).data;
           // CorrectProduct.description = removeAllHtmlTags(CorrectProduct.description);

            if(CorrectProduct.totalQuantity ==0){
              quantity = 0;
            }
            print(CorrectProduct.description);
            return CorrectProduct;
          } else {
            return null;
          }
        } else {
          throw ("Not found");
        }
      }catch(e){
        throw ("Not found");
      }
    });
  }
}
