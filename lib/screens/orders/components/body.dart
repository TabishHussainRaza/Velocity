import 'dart:convert';

import 'package:ecommerece_velocity_app/models/orders.dart';
import 'package:ecommerece_velocity_app/screens/orders/view_order/view_order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/sign_in_screen.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  _OrderBody createState() => _OrderBody();
}

class _OrderBody extends State<OrderBody> {
  late SharedPreferences sharedPreferences;
  late List<Order> allOrdersList;

  @override
  void initState() {
    ordersList();
    super.initState();
    loginStatus();
  }

  loginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => SignInPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ordersList(),
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
              return ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      color: const Color(0xFFF5F6F9),
                      //primary: kPrimaryColor,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 0.0,
                      //backgroundColor: const Color(0xFFF5F6F9),
                      child: /*Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Order ID: "+ snapshot.data[index].id.toString(), style: TextStyle(fontSize: getProportionateScreenWidth(20),fontWeight: FontWeight.w900))

                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("\nLast Updated: "+DateFormat('yyyy-MM-dd').format(snapshot.data[index].createdAt)

                                  +
                                  "\nOrder Placed on: " + DateFormat('yyyy-MM-dd').format(snapshot.data[index].updatedAt)

                                  + " \n" +snapshot.data[index].status.toUpperCase()),
                          )
                        ],
                      ),
                    )*/
                          InkWell(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Order Number: " +
                                        snapshot.data[index].id.toString(),
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(20),
                                    )),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.01),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Last Updated: " +
                                    DateFormat('yyyy-MM-dd').format(
                                        snapshot.data[index].createdAt)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Order Placed on: " +
                                    DateFormat('yyyy-MM-dd').format(
                                        snapshot.data[index].updatedAt)),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.01),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(15)),
                                        color: snapshot.data[index].status ==
                                                "completed"
                                            ? Colors.green
                                            : snapshot.data[index].status ==
                                                    "pending"
                                                ? Colors.yellow
                                            : snapshot.data[index].status ==
                                            "processing"
                                            ? Colors.purple
                                                : Colors.red),
                                    child: Text(
                                      "  " +
                                          snapshot.data[index].status
                                              .toString()
                                              .toUpperCase() +
                                          "  ",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ViewOrderScreen(
                                        MyOrder: snapshot.data[index],
                                      )),
                              (Route<dynamic> route) => true);
                        },
                      )

                      /*ListTile(
                      title: ,
                      subtitle: Text("\nLast Updated: "+DateFormat('yyyy-MM-dd').format(snapshot.data[index].createdAt)

                          +
                          "\nOrder Placed on: " + DateFormat('yyyy-MM-dd').format(snapshot.data[index].updatedAt)

                          + " \n" +snapshot.data[index].status.toUpperCase()),
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ViewOrderScreen(MyOrder: snapshot.data[index],)), (Route<dynamic> route) => true);
                      },
                    )*/
                      );
                },
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
                            Text('Looks like you don\'t have any orders.',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(15))),
                            Text('Buy now and track your orders',
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

  Future<dynamic> ordersList() async {
    List<Order> allOrdersList;

    sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString('cookies') ?? '';
    final id = sharedPreferences.getString('user_id') ?? '';

    String url = serverUrl + "orders?customer_id=$id";
    try{
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Cookie': name,
        'Connection': 'keep-alive',
      });
      if (response.statusCode == 200) {
        var jsonResponse = await json.decode(response.body);
        if (jsonResponse != null) {
          allOrdersList = ordersListFromJson(response.body).data;
          if (allOrdersList.isEmpty) {
            return null;
          }
          return allOrdersList;
        }
      } else {
      }
    }catch(e){
      print(e);
      throw ("Not found");
    }
  }
}
