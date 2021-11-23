import 'dart:convert';

import 'package:ecommerece_velocity_app/helper/keyboard.dart';
import 'package:ecommerece_velocity_app/models/address.dart';
import 'package:ecommerece_velocity_app/models/country.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../main_address.dart';

class UpdateAddressForm extends StatefulWidget {
  final Address AddressID;

  UpdateAddressForm({Key? key, required this.AddressID}) : super(key: key);

  @override
  _AddAddressForm createState() => _AddAddressForm();
}

class _AddAddressForm extends State<UpdateAddressForm> {
  late Country SelectedCountry;
  late AddressData currentAddress;
  late SharedPreferences sharedPreferences;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  bool _isLoading = false;
  String? firstName;
  String? lastName;
  String? company;
  String? phoneNumber;
  String? addressStreet1;
  String? addressStreet2;
  String? city;
  String? country;
  String? state;
  String? zipcode;

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
      future: getAddressDetails(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
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
        } else {
          if (snapshot.hasData == true) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  buildFirstNameFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildLastNameFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildCompanyFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildPhoneNumberFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildAddressFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildCountryFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildCityFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildStateFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildPostalFormField(),
                  FormError(errors: errors),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  DefaultButton(
                    condition: true,
                    text: "Update Address",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _isLoading = true;
                        // if all are valid then go to success screen
                        const snackBar =
                            SnackBar(content: Text('Processing...'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        errors.clear();
                        UpdateAddress();
                        KeyboardUtil.hideKeyboard(context);
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(35)),
                  DefaultButton(
                    condition: true,
                    text: "Delete Address",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _isLoading = true;
                        // if all are valid then go to success screen
                        const snackBar =
                            SnackBar(content: Text('Processing...'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        errors.clear();
                        DeleteAddress();
                        KeyboardUtil.hideKeyboard(context);
                      }
                    },
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
        }
      },
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      initialValue: currentAddress.data.address1[0],
      onSaved: (newValue) => addressStreet1 = newValue,
      //autocorrect: false,
      //controller: _Controller,
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
        labelText: "Address",
        hintText: "Enter your address",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon:
        //CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildCountryFormField() {
    final TextEditingController _controller = TextEditingController();
    if (!currentAddress.data.country.isEmpty) {
      _controller.text = currentAddress.data.countryName;
      SelectedCountry = Country(
          id: currentAddress.data.id,
          title: currentAddress.data.country,
          description: currentAddress.data.countryName);
    } else {
      _controller.text = "Please Select";
    }
    return TextFormField(
        onSaved: (value) => country = value,
        controller: _controller,
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
        decoration: InputDecoration(
          labelText: "Country",
          hintText: "Please Select Country",
          // If  you are using latest version of flutter then label text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: PopupMenuButton<Country>(
            icon: const Icon(Icons.arrow_drop_down),
            onSelected: (Country value) {
              country = value.description;
              SelectedCountry = Country(
                  id: value.id,
                  title: value.title,
                  description: value.description);
              _controller.text = value.description;
            },
            itemBuilder: (BuildContext context) {
              return CountryList.map<PopupMenuItem<Country>>((Country value) {
                return PopupMenuItem(
                    child: Text(value.description), value: value);
              }).toList();
            },
            //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
          ),
        ));
  }

  TextFormField buildCountryField() {
    return TextFormField(
      initialValue: currentAddress.data.country,
      onSaved: (newValue) => country = newValue,
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
        labelText: "Country",
        hintText: "Enter your Country",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon:
        //CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildCityFormField() {
    return TextFormField(
      initialValue: currentAddress.data.city,
      onSaved: (newValue) => city = newValue,
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
        labelText: "City",
        hintText: "Enter your City",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon:
        //CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildStateFormField() {
    return TextFormField(
      initialValue: currentAddress.data.state,
      onSaved: (newValue) => state = newValue,
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
        labelText: "State/Division",
        hintText: "Enter your state/division",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon:
        //CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPostalFormField() {
    return TextFormField(
      initialValue: currentAddress.data.postcode,
      onSaved: (newValue) => zipcode = newValue,
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
        labelText: "Postal Address",
        hintText: "Enter your postal address",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon:
        //CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      initialValue: currentAddress.data.phone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildCompanyFormField() {
    return TextFormField(
      initialValue: currentAddress.data.companyName,
      onSaved: (newValue) => company = newValue,
      decoration: const InputDecoration(
        labelText: "Company Name",
        hintText: "Company Name",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      initialValue: currentAddress.data.lastName,
      onSaved: (newValue) => lastName = newValue,
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      initialValue: currentAddress.data.firstName,
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
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then label text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  getAddressDetails() async {
    var id = widget.AddressID.id;
    sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString('cookies') ?? '';

    String url = serverUrl + "addresses/$id";
    try {
      var response = await http.get(Uri.parse(url), headers: {
        'Cookie': name,
        'Connection': 'keep-alive',
      });
      if (response.statusCode == 200) {
        var jsonResponse = await json.decode(response.body);

        if (jsonResponse != null) {
          currentAddress = addressDataFromJson(response.body);
          return currentAddress;
        }
      } else {}
    } catch (e) {
      throw ("Not found");
    }
  }

  UpdateAddress() async {
    var id = widget.AddressID.id;
    String url = serverUrl + "addresses/$id";
    Map data = {
      "first_name": firstName,
      "last_name": lastName,
      "company_name": company,
      "vat_id": "",
      'is_default': "false",
      "address1[0]": addressStreet1,
      "country": SelectedCountry.title,
      "country_name": SelectedCountry.description,
      "state": state,
      "city": city,
      "postcode": zipcode,
      "phone": phoneNumber,
    };
    sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString('cookies') ?? '';
    try {
      var response = await http.put(Uri.parse(url),
          headers: {
            'Cookie': name,
          },
          body: data);

      setState(() {
        _isLoading = false;
      });
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse != null) {
          setState(() {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          });
          const snackBar =
              SnackBar(content: Text('Address Updated Successfully'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        const snackBar =
            SnackBar(content: Text('Oops! Ran into some problem. Try again'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      const snackBar =
          SnackBar(content: Text('Oops! Ran into some problem. Try again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  DeleteAddress() async {
    var id = widget.AddressID.id;
    String url = serverUrl + "addresses/$id";
    sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString('cookies') ?? '';

    try {
      var response = await http.delete(Uri.parse(url), headers: {
        'Cookie': name,
      });

      setState(() {
        _isLoading = false;
      });
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse != null) {
          setState(() {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          });
          const snackBar = SnackBar(content: Text('Address Deleted'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const AddressScreen()),
              (Route<dynamic> route) => true);
        }
      } else {
        const snackBar =
            SnackBar(content: Text('Oops! Ran into some problem. Try again'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      const snackBar =
          SnackBar(content: Text('Oops! Ran into some problem. Try again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
