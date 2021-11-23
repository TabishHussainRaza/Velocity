import 'package:ecommerece_velocity_app/components/default_button.dart';
import 'package:ecommerece_velocity_app/models/Cart.dart';
import 'package:ecommerece_velocity_app/models/products.dart';
import 'package:ecommerece_velocity_app/screens/home/home_screen.dart';
import 'package:ecommerece_velocity_app/services/payment_service.dart';
import 'package:ecommerece_velocity_app/size_config.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:progress_dialog/progress_dialog.dart';

class PaymentPage extends StatefulWidget {
  static String routeName = "/paymentHomepage";

  PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double total = 0;
  int newTotal = 90; 
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, "/existing-card");
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
    await StripeService.payWithNewCard(amount: newTotal.toString(), currency: 'FJD');
    await dialog.hide();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
      Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }
  
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < demoCarts.length; i++) {
      total = total + double.parse(demoCarts[i].product.price) * demoCarts[i].numOfItem;
       newTotal = newTotal + total.toInt(); 
    }
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon? icon;
              Text? text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = const Text("Pay Via New Card");
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: theme.primaryColor);
                  text = const Text("Pay Via Existing Card");
                  break;
              }
              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: 2),
      ),
      bottomNavigationBar: GestureDetector(
       onTap: () => Navigator.pushNamed(
           context, HomeScreen.routeName),
       child: SizedBox(
         width: getProportionateScreenWidth(190),
         height: getProportionateScreenHeight(50),
         child: const DefaultButton(
           text: "Continue Shopping",
         ),
       ),
     ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "Payment",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
