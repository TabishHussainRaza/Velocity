import 'dart:convert';
import 'package:ecommerece_velocity_app/models/address.dart';
import 'package:ecommerece_velocity_app/screens/adresss/create_address/add_adress.dart';
import 'package:ecommerece_velocity_app/screens/adresss/update_address/update_address.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/sign_in_screen.dart';
import 'package:http/http.dart' as http;


class AddressBody extends StatefulWidget {
  const AddressBody({Key? key}) : super(key: key);

  @override
  _ProfileBody createState() => _ProfileBody();
}
class _ProfileBody extends State<AddressBody> {
  late SharedPreferences sharedPreferences;
  late List<Address> allAddressList;
  @override
  void initState() {
    addressList();
    super.initState();
    loginStatus();
  }

  loginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const SignInPage()), (Route<dynamic> route) => false);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: addressList(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
                //child:
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor),
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
          }  else if (snapshot.connectionState == ConnectionState.done){
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
            }
            else if (snapshot.hasData == true){
              return ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      color: const Color(0xFFF5F6F9),
                      //primary: kPrimaryColor,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0.0,
                      //backgroundColor: const Color(0xFFF5F6F9),phone
                      child: ListTile(
                        title: Text(snapshot.data[index].firstName +" "+ snapshot.data[index].lastName),
                        subtitle: Text(snapshot.data[index].address1[0]+"\n "+snapshot.data[index].city+"\n "+snapshot.data[index].countryName+"\n "+snapshot.data[index].phone),
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => UpdateAddressScreen(AddressID: snapshot.data[index],)), (Route<dynamic> route) => true);
                        },
                      )
                  );
                },
              );
            }
            else{
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
                                'Looks like you don\'t have any address.',
                              style: TextStyle(fontSize: getProportionateScreenWidth(15))),
                            Text(
                                'Click + to Add new Address!',style: TextStyle(fontSize: getProportionateScreenWidth(15))),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

              );
            }
          }
          else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }
  Future<dynamic> addressList() async {
    List<Address> allAddressList;
    String url = serverUrl + "addresses";
    sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString('cookies') ?? '';
    try{
      var response = await http.get(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Cookie':name,
            'Connection': 'keep-alive',
          }
      );
      if(response.statusCode == 200) {
        var jsonResponse = await json.decode(response.body);
        if(jsonResponse != null) {
          allAddressList = addressListFromJson(response.body).data;
          if(allAddressList.isEmpty){
            return null;
          }
          return allAddressList;
        }else{
          return null;
        }
      }
      else {
        throw ("Not found");
      }
    }catch(e){
      throw ("Not found");
    }
  }
}
