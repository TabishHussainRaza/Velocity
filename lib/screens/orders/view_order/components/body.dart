import 'package:ecommerece_velocity_app/models/address.dart';
import 'package:ecommerece_velocity_app/models/orders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class Body extends StatefulWidget {
  Order MyOrder;
  Body({Key? key, required this.MyOrder}) : super(key: key);

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
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 0.5,
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Order Details ",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          Text("Order ID: " + widget.MyOrder.id.toString(), overflow: TextOverflow.ellipsis),
                          Text("Order Placed on: " + DateFormat('yyyy-MM-dd').format(widget.MyOrder.createdAt), overflow: TextOverflow.ellipsis),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                                color:widget.MyOrder.status == "completed" ?
                                Colors.green : widget.MyOrder.status == "pending" ?


                                Colors.yellow
                                    : widget.MyOrder.status ==
                                    "processing"
                                    ? Colors.purple
                                    :Colors.red
                                ),
                            child:
                            Text("  "+ widget.MyOrder.status.toString().toUpperCase() + "  ",

                              style: const TextStyle(
                                color:Colors.white,
                              ),),


                            )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Container(
                  padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 0.5,
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Item Details ",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          Text("Total Items Ordered: " + widget.MyOrder.items.length.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: widget.MyOrder.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: const Color(0xFFF5F6F9),
                          //primary: kPrimaryColor,
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 0.0,
                          //backgroundColor: const Color(0xFFF5F6F9),
                          child:
                          Container(
                            padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      widget.MyOrder.items[index].name,
                                      style: const TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                                    RichText(
                                      text: const TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: kTextColor,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: 'Quantity Details: ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                                    RichText(
                                      text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: kTextColor,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(text: 'Ordered:  ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                          TextSpan(text: widget.MyOrder.items[index].qtyOrdered.toString(), ),
                                          const TextSpan(text: '\nShipped:  ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                           TextSpan(text: widget.MyOrder.items[index].qtyShipped.toString()),
                                          const TextSpan(text: '\nCancelled:  ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                           TextSpan(text: widget.MyOrder.items[index].qtyCanceled.toString(),),
                                          const TextSpan(text: '\nRefunded:  ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                          TextSpan(text: widget.MyOrder.items[index].qtyRefunded.toString()),
                                          const TextSpan(text: '\n\nPrice:  ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                          TextSpan(text: widget.MyOrder.items[index].formatedBasePrice),
                                          const TextSpan(text: '\nSubtotal:  ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                          TextSpan(text: widget.MyOrder.items[index].formatedBaseTotal)

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      );
                    }),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Container(
                  padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 0.5,
                        color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text(
                            "Price Details ",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                          RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: kTextColor,
                              ),
                              children: <TextSpan>[
                                const TextSpan(text: 'Subtotal: ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text:widget.MyOrder.formatedBaseSubTotal),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: kTextColor,
                              ),
                              children: <TextSpan>[
                                const TextSpan(text: 'Shipping and Handling: ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text:widget.MyOrder.formatedShippingAmount),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: kTextColor,
                              ),
                              children: <TextSpan>[
                                const TextSpan(text: 'Tax: ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text:widget.MyOrder.formatedTaxAmount),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: kTextColor,
                              ),
                              children: <TextSpan>[
                                const TextSpan(text: 'Discount: ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text:widget.MyOrder.formatedDiscountAmount),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          RichText(
                            text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: kTextColor,
                              ),
                              children: <TextSpan>[
                                const TextSpan(text: 'Grandtotal: ',  style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text:widget.MyOrder.formatedGrandTotal),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Container(
                  padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Shipment and Payment Info",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                          const Text("Shipping Address" ,style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.MyOrder.shippingAddress.address1[0] +", "+ widget.MyOrder.shippingAddress.city +", "+ widget.MyOrder.shippingAddress.state +", "+ widget.MyOrder.shippingAddress.country),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          const Text("Shipping Method" ,style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.MyOrder.shippingMethod),
                          SizedBox(height: SizeConfig.screenHeight * 0.01),
                          const Text("Payment Method" ,style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.MyOrder.paymentTitle),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

