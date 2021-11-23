import 'package:flutter/material.dart';
import '../settings_page.dart';
import 'button_widget.dart';

class ReportABug extends StatefulWidget {
  static String routeName = "/ReportABug_form";
  const ReportABug({Key? key}) : super(key: key);

  @override
  _ReportABugState createState() => _ReportABugState();
}

class _ReportABugState extends State<ReportABug> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String category = '';
  String bugdescritpion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Form(
        key: formKey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildTitle(),
            const SizedBox(height: 16),
            buildCategory(),
            const SizedBox(height: 32),
            buildBugDescritpion(),
            const SizedBox(height: 32),
            buildSubmit(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const SettingsPage()),
              (Route<dynamic> route) => false);
        },
      ),
      automaticallyImplyLeading: true,
      title: Column(
        children: const [
          Text(
            "Report A Bug Form",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Bug Title',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value!.length < 10) {
            return 'Enter at least 10 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => title = value!),
      );

  Widget buildCategory() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Category',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 5) {
            return 'Enter at least 5 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => title = value!),
      );

  Widget buildBugDescritpion() => TextFormField(
        decoration: const InputDecoration(
          labelText: 'Bug Descritpion',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value!.length < 30) {
            return 'Enter at least 30 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => bugdescritpion = value!),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();

              final message =
                  'Bug Title: $title\nBugDescription: $bugdescritpion\nCategory: $category';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: const TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );
}
