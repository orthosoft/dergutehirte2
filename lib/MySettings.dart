import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dergutehirte/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MySettings extends StatefulWidget {
  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  int? fontSize;
  // bool notificationFlag;

  _MySettingsState() {
    // getNotificationFlag();
  }

  // void getNotificationFlag() async{
  //   notificationFlag = await SharedPrefs().getNotificationFlag() == "true" ? true : false;
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("lang!.settings"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Consumer<LocaleModel>(
        builder: (context, localeModel, child) => Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(AppLocalizations.of(context)!.helloWorld,
                        style: TextStyle(color: Global.colorFG, fontSize: 16))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                  child: DropdownButton(
                    style: const TextStyle(color: Colors.brown, fontSize: 16),
                    value: fontSize,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        child: Text("lang!.fontSmall"),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("lang!.fontMedium"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("lang!.fontLarge"),
                        value: 2,
                      ),
                    ],
                    onChanged: (int? value) {
                      switch (value) {
                        case 0:
                          // SharedPrefs().setFontSize("16");
                          setState(() {
                            fontSize = 0;
                          });
                          break;
                        case 1:
                          setState(() {
                            fontSize = 1;
                          });
                          // SharedPrefs().setFontSize("20");
                          break;
                        case 2:
                          setState(() {
                            fontSize = 2;
                          });
                          // SharedPrefs().setFontSize("24");
                          break;
                      }
                    },
                  ),
                ),
                TextButton(
                    child: Text("Set locale to German1"),
                    onPressed: () {
                      localeModel.set(Locale("de"));
                      setState(() {});
                    }),
                TextButton(
                    child: Text("Set locale to Arabic1"),
                    onPressed: () {
                      localeModel.set(Locale("ar"));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new MySettings()));
                      setState(() {});
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
