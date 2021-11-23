import 'dart:convert';
import 'dart:io';
import 'package:ecommerece_velocity_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../helper/keyboard.dart';
import '../../../models/Customer.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../home/home_screen.dart';
import 'package:http/http.dart' as http;

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  bool _isLoading = false;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
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
  /*Widget build(BuildContext context) {
    return LoadingOverlay(
        child: buildLoginForm(context),
        isLoading: _isLoading,
        // demo of some additional parameters
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(),
      );
  }*/
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),

          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            condition: true,
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // start the modal progress HUD
                setState(() {
                  _isLoading = true;
                });
                const snackBar = SnackBar(content: Text('Processing...'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                signIn();
                KeyboardUtil.hideKeyboard(context);

              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 3) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 3) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
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
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  signIn() async {
    String url = serverUrl + "customer/login";
    SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password,
    };

    print(url);
    try{
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Connection': 'keep-alive',
          },
          body: json.encode(data));
      print(response.statusCode);
      if(response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if(jsonResponse != null) {
          setState(() {
            _isLoading = false;
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          });
          sharedPreferences.setString("token", "true");
          var cookies = response.headers['set-cookie'];
          sharedPreferences.setString("cookies", cookies!);
          sharedPreferences.setString("user", response.body);

          sharedPreferences.setString("user_id", customerFromJson(response.body).data.id.toString());
          const snackBar = SnackBar(content: Text('Login Successful'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ProfileScreen()), (Route<dynamic> route) => false);
          //
        }
      }
      else {
        setState(() {
          _isLoading = false;
        });
        const snackBar = SnackBar(content: Text('Not Valid! Try again'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }catch(e){
      const snackBar = SnackBar(content: Text('Oops something went wrong Try again'));
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
