import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dergutehirte/languages/localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:dergutehirte/languages/languages.dart';
// import 'package:dergutehirte/languages/locale_constant.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dergutehirte/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:dergutehirte/MySettings.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static String? lang;
  static void setLocale(BuildContext context, Locale newLocale) {
    // var state =
    //     context.findAncestorStateOfType<_MyBottomNavigationBarState>();
    // state?.setLocale(newLocale);
    // lang = newLocale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleModel(),
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child) => MaterialApp(
          locale: localeModel.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const MyBottomNavigationBar(),

          /* ... */
        ),
      ),
    );
  }
}

class LocaleModel extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;
  Locale? _locale;

  // Access Firestore using the default Firebase app:

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'documentStream1',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  // @override
  // void didChangeDependencies() async {
  //   getLocale().then((locale) {
  //     setState(() {
  //       _locale = locale;
  //     });
  //   });
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //Kalendar hier
          Consumer<LocaleModel>(
        builder: (context, localeModel, child) => Column(
          children: [
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            Text(AppLocalizations.of(context)!.helloWorld),
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
                  setState(() {
                    localeModel.set(Locale("ar"));
                  });
                  Fluttertoast.showToast(
                      msg: AppLocalizations.of(context)!.helloWorld);
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "AppLocalizations.of(context)!.helloWorld",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Nathay',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Future<String> getData(
      String collection, String document, String field) async {
    DocumentSnapshot update = await FirebaseFirestore.instance
        .collection(collection)
        .doc(document)
        .get();
    Map<String, dynamic> updateData = update.data() as Map<String, dynamic>;
    return updateData[field];
  }
}

class Global {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  static final Color colorBG = Colors.white54;
  static final Color colorFG = Colors.indigo;
  static msgbox(BuildContext context, String message) {
    Widget ok = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Languages.of(context)!.appName"),
          content: Text(message),
          actions: [
            ok,
          ],
          elevation: 5,
        );
      },
    );
  }
}
