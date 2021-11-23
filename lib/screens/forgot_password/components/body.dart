import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
import '../../../helper/keyboard.dart';
import '../../sign_in/sign_in_screen.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(50)),
              const ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  String? resetEmail;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  bool _isLoading = false;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            condition: true,
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                _isLoading =true;
                const snackBar = SnackBar(content: Text('Processing...'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                KeyboardUtil.hideKeyboard(context);
                Reset();
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          const NoAccountText(),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => resetEmail = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration:const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
  Reset() async {
    String url = serverUrl + "customer/forgot-password";
    Map data = {
      'email': resetEmail
    };
    try{
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: json.encode(data));
      if(response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if(jsonResponse != null) {
          setState(() {
            _isLoading = false;
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          });
          const snackBar = SnackBar(content: Text('We have e-mailed your password reset link!'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SignInPage()), (Route<dynamic> route) => true);
        }
      }
      else {
        print(response.body);
        setState(() {
          _isLoading = false;
        });
        const snackBar = SnackBar(content: Text('Oops! Something went wrong.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }catch(e){
      const snackBar = SnackBar(content: Text('Oops something went wrong Try again'));
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
