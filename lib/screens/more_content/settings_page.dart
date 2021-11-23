import 'package:ecommerece_velocity_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'Report_a_bug_form/report_a_bug.dart';
import 'componets/icon_widget.dart';
import 'contact_us_form/contact_us.dart';
import 'feedback_form/feedback_form.dart';

class SettingsPage extends StatefulWidget {
  static String routeName = "/settings";
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                SettingsGroup(
                  title: "PREFERENCES",
                  children: <Widget>[
                    buildLangauage(context),
                    buildLocation(context),
                  ],
                ),
                const SizedBox(height: 32.0),
                SettingsGroup(
                  title: "GENERAL",
                  children: <Widget>[
                    buildAboutUs(context),
                    buildReturnPolicy(context),
                    buildTermsAndCondtitons(context)
                  ],
                ),
                const SizedBox(height: 32.0),
                SettingsGroup(title: "FEEDBACK", children: <Widget>[
                  buildSendFeedback(context),
                  buildReportABug(context),
                  buildContactUs(context)
                ]),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const HomeScreen()),
              (Route<dynamic> route) => true);
        },
      ),
      automaticallyImplyLeading: false,
      title: Column(
        children: const [
          Text(
            "More Content",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildAboutUs(context) => SimpleSettingsTile(
      title: "About Us",
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.settings_accessibility_outlined,
        color: Colors.lightBlueAccent,
      ),
      onTap: () {
        aboutAppAndDevelopers();
      });

  void aboutAppAndDevelopers() {
    showAboutDialog(
        context: context,
        applicationIcon: const FlutterLogo(),
        applicationName: "About App",
        applicationVersion: "0.0.1",
        applicationLegalese: "Developed by Team 15",
        children: <Widget>[
          const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ]);
  }

  Widget buildReturnPolicy(context) => SimpleSettingsTile(
      title: "Return Policy",
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.policy_rounded,
        color: Colors.deepOrange,
      ),
      onTap: () {
         _showReturnPolicyDialog();
      });

  Future<void> _showReturnPolicyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Return Policy'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildContactUs(context) => SimpleSettingsTile(
      title: "Contact Us",
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.contact_phone,
        color: Colors.greenAccent,
      ),
      onTap: () {
         Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const ContactForm()),
              (Route<dynamic> route) => false);
      });

  Widget buildReportABug(context) => SimpleSettingsTile(
      title: "Report A Bug",
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.bug_report_outlined,
        color: Colors.red,
      ),
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const ReportABug()),
              (Route<dynamic> route) => false);
      });

  Widget buildSendFeedback(context) => SimpleSettingsTile(
      title: "Send FeedBack",
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.thumb_up_alt_rounded,
        color: Colors.greenAccent,
      ),
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const FeedBack()),
              (Route<dynamic> route) => false);
      });

  Widget buildTermsAndCondtitons(context) => SimpleSettingsTile(
      title: "Terms & Condtions",
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.rule_sharp,
        color: Colors.deepPurpleAccent,
      ),
      onTap: () {
        _showTermsAndCondtitonsDialog();
      });

  Future<void> _showTermsAndCondtitonsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terms & Condtions'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildLangauage(context) => DropDownSettingsTile(
        settingKey: keyLanguage,
        title: "Languages",
        selected: 1,
        values: const <int, String>{
          1: "English ",
        },
        onChange: (language) {/*NOOP*/},
      );

  Widget buildLocation(context) => TextInputSettingsTile(
        settingKey: keyLocation,
        title: "Locations",
        initialValue: "Fiji",
        onChange: (location) {/*NOOP*/},
      );
}
