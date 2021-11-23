import 'package:ecommerece_velocity_app/models/Cart.dart';
import 'package:ecommerece_velocity_app/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:progress_dialog/progress_dialog.dart';
import 'package:stripe_payment/stripe_payment.dart';


class ExistingCardPage extends StatefulWidget {
  static String routeName = "/existing-card";
  const ExistingCardPage({Key? key}) : super(key: key);

  @override
  _ExistingCardPageState createState() => _ExistingCardPageState();
}

class _ExistingCardPageState extends State<ExistingCardPage> {
  double total = 0;
  int newTotal = 90; 
  bool isCvvFocused = false;
  List cards= [{
    'cardNumber' : '4242424242424242',
    'expiryDate' : '04/24',
    'cardHolderName' : 'Muhammad Ahsan Ayaz',
    'cvvCode' : '424',
    'showBackView' : 'false',
  }, {
    'cardNumber' : '5105105105105100',
    'expiryDate' : '04/23',
    'cardHolderName' : 'Tracer',
    'cvvCode' : '123',
    'showBackView' : 'false',
  }, {
    'cardNumber' : '3756002020360505',
    'expiryDate' : '04/26',
    'cardHolderName' : 'Saurab Nand',
    'cvvCode' : '126',
    'showBackView' : 'false',

  }];

  payViaExistingCard(BuildContext context, card) async {

    ProgressDialog dialog = ProgressDialog(context);
    dialog.style(
        message: 'Please wait...'
    );
    await dialog.show();
    var expiryArr = card['expiryDate'].split('/');
    CreditCard stripCard = CreditCard(
      number: card["cardNumber"],
      expMonth: int.parse(expiryArr[0]),
      expYear: int.parse(expiryArr[1]),
    );
    var response =  await StripeService.payViaExistingCard(
        amount: newTotal.toString(),
        currency: 'FJD',
        card: stripCard
    );
    await dialog.hide();
    if(response.success = true){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
            duration: const Duration(microseconds: 300000),
          )
      ).closed.then((value) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < demoCarts.length; i++) {
      total = total + double.parse(demoCarts[i].product.price) * demoCarts[i].numOfItem;
      newTotal = newTotal + total.toInt(); 
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Existing Card"),
      ),
      body: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index){
            var card = cards[index];
            return InkWell(
              onTap: (){
                print("TOTAL : " + newTotal.toString());
                payViaExistingCard(context, card);
              },
              child: CreditCardWidget(
                height: 222.0,
                textStyle: const TextStyle(color: Colors.white),
                animationDuration: const Duration(milliseconds: 1000),
                width: MediaQuery.of(context).size.width,
                isHolderNameVisible: true,
                cardNumber : card['cardNumber'],
                expiryDate : card['expiryDate'],
                cardHolderName : card[ 'cardHolderName'],
                cvvCode : card['cvvCode'],
                // ignore: non_constant_identifier_names
                showBackView : isCvvFocused, onCreditCardWidgetChange: (CreditCardBrand ) {  },
              ),
            );
          }
      ),
    );
  }

}
