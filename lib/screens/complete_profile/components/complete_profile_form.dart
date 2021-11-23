import 'dart:convert';
import 'package:ecommerece_velocity_app/components/datepicker.dart';
import 'package:ecommerece_velocity_app/helper/keyboard.dart';
import 'package:ecommerece_velocity_app/models/Customer.dart';
import 'package:ecommerece_velocity_app/models/customer_data.dart';
import 'package:ecommerece_velocity_app/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../otp/otp_screen.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import '../../../size_config.dart';


class CompleteProfileForm extends StatefulWidget {
  Customer CurrentCustomer;

  CompleteProfileForm({Key? key, required this.CurrentCustomer}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  late CustomerData currentCustomer;
  final _formKey = GlobalKey<FormState>();
  //final _DateKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? gender;
  String? _selectedDate;
  bool _isLoading = false;
  late SharedPreferences sharedPreferences;
  var items = ['Male', 'Female', 'Others'];

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
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCustomerDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data == null){
            if (snapshot.hasError) {
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
                            SizedBox(height: getProportionateScreenHeight(150)),
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
            } else {
              return Center(
                //child:
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: getProportionateScreenHeight(150)),
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
            }
          }else{
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  buildFirstNameFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildLastNameFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildEmailAddressFormField(),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  MyTextFieldDatePicker(
                    dateFormat:DateFormat.yMMMMd("en_US"),
                    labelText: "Date",
                    prefixIcon: const Icon(Icons.date_range),
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                    lastDate: DateTime.now().add(const Duration(days: 366)),
                    firstDate: DateTime(1950),
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    key: ValueKey<int>(currentCustomer.data.id),
                    onDateChanged: (selectedDate) {
                      setState(() {
                        _isLoading = true;
                      });
                      _selectedDate = DateFormat('yyyy-MM-dd'). format(selectedDate);
                    }, CustomerDOB: currentCustomer.data.dateOfBirth,
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  buildGenderFormField(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  FormError(errors: errors),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  DefaultButton(
                    condition: true,
                    text: "Update",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // if all are valid then go to success screen
                        const snackBar = SnackBar(content: Text('Processing...'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        UpdateProfile();
                        KeyboardUtil.hideKeyboard(context);
                      }
                    },
                  ),
                ],
              ),
            );
      }
    },
    );

  }

  TextFormField buildGenderFormField() {
    final TextEditingController _controller = TextEditingController();
    if(currentCustomer.data.gender != null){
      _controller.text = currentCustomer.data.gender!;
    }else{
      _controller.text = "Please Select";
    }


    return TextFormField(
        onSaved: (value) => gender = value,
      controller: _controller,
      decoration: InputDecoration(
        labelText: "Gender",
        hintText: "Please Select Gender",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: PopupMenuButton<String>(

          icon: const Icon(Icons.arrow_drop_down),
          onSelected: (String value) {
            gender = value;
            _controller.text = value;
          },
          itemBuilder: (BuildContext context) {
            return items
                .map<PopupMenuItem<String>>((String value) {
              return PopupMenuItem(
                  child: Text(value), value: value);
            }).toList();
          },
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
        ),
      )

    );
    print(gender);
  }

  TextFormField buildEmailAddressFormField() {
    return TextFormField(
      initialValue:  currentCustomer.data.email,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email Address",
        hintText: "Enter your email address",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      initialValue:  currentCustomer.data.lastName,
      onSaved: (newValue) => lastName = newValue,
      decoration:const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
       // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      initialValue:  currentCustomer.data.firstName,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration:const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  getCustomerDetails() async {
    var id = widget.CurrentCustomer.data.id;
    sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString('cookies') ?? '';

    String url = serverUrl + "customers/$id";
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
          currentCustomer =customerDataFromJson(response.body);
          return currentCustomer;
        }
      }
    }catch(e){
      throw ("Not found");
    }
  }

  UpdateProfile() async {
    var id = widget.CurrentCustomer.data.id;
    String url = serverUrl+"customer/profile";

    if(_isLoading == false){
      _selectedDate = currentCustomer.data.dateOfBirth;
    }
    Map data = {
      "first_name": firstName,
      "last_name": lastName,
      "gender":gender,
      "date_of_birth":_selectedDate,
      "email":address,
    };
    print(data);
    sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString('cookies') ?? '';
    var response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Connection': 'keep-alive',
          'Cookie':name,
        }, body: json.encode(data));

    if(response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        });
        const snackBar = SnackBar(content: Text('Details Updated Successfully'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
    }
    else {
      const snackBar = SnackBar(content: Text('Oops! Ran into some problem. Try again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
