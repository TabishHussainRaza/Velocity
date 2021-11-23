import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';


class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({required this.message, required this.success});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = "${StripeService.apiBase}/payment_intents";
  static String secret = 'sk_test_51JoQtyGkREr8GUnto7YdwMhdqFGmak9WQpwCffQ51iZfUFIUBfxUYxdgOMHGpSl1wQjRCQEP9uU99soFvy49pPCm00uu7zPOBe';
  static Map<String, String> headers = {
    'Authorization' : 'Bearer ${StripeService.secret}',
    'Content-Type' : 'application/x-www-form-urlencoded'
  };
  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
        "pk_test_51JoQtyGkREr8GUntoD5iOADase6xLGhU6I8Fue3rouMxC05EFVmPN3aJFQUrKfBcJqsAMGBqDoGm3xVIgG7tF2Kp00NgZXuGcY",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  static Future<StripeTransactionResponse> payViaExistingCard(
      {required String amount, required String currency, required CreditCard card}) async {
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card)
      );
      var paymentIntent = await StripeService.createPaymentIntent(
          amount,
          currency
      );
      var response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent!["client_secret"],
              paymentMethodId: paymentMethod.id
          )
      );
      if(response.status == "succeeded"){
        message: "Transaction Successful";
        success: true;
      }else{
        message: 'Transaction Failed: #{err.toString()}';
        success: true;
      }
      return StripeTransactionResponse(
          message: "Transaction Successful", success: true);
    } on PlatformException catch (err) {
      return StripeService.getPlatFormExceptionErrorResults(err);
    }catch(err){
      return StripeTransactionResponse(
          message: 'Transaction Failed: #{err.toString()}', success: true);
    }
  }

  static Future<StripeTransactionResponse> payWithNewCard(
      {required String amount, required String currency}) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      var paymentIntent = await StripeService.createPaymentIntent(
          amount,
          currency
      );
      var response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent!["client_secret"],
              paymentMethodId: paymentMethod.id
          )
      );
      if(response.status == "succeeded"){
        message: "Transaction Successful";
        success: true;
      }else{
        message: 'Transaction Failed: #{err.toString()}';
        success: true;
      }
      return StripeTransactionResponse(
          message: "Transaction Successful", success: true);
    } on PlatformException catch (err) {
      return StripeService.getPlatFormExceptionErrorResults(err);
    }catch(err){
      return  StripeTransactionResponse(
          message: 'Transaction Failed: #{err.toString()}', success: true);
    }
  }

  static getPlatFormExceptionErrorResults(err){
    String message = "Something went wrong";
    if(err.code == "cancelled"){
      message = "Transaction Cancelled";
    }

    return  StripeTransactionResponse(
        message: message,
        success: false
    );
  }

  static Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async{
    try {
      Map<String, dynamic> body = {
        'amount' : amount,
        'currency' : currency,
        'payment_method_types[]' : 'card'
      };
      var response = await http.post(
        Uri.parse(StripeService.paymentApiUrl),
        body: body,
        headers: StripeService.headers,
      );
      return jsonDecode(response.body);
    } catch (err) {
      print("err charging user: ${err.toString()}");
    }
    return null;
  }
}
