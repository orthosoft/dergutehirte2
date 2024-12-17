// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCD3hV2EI64zYHujQzdphFj64gVGyhJyqg',
    appId: '1:223211044513:web:e3ccfca59dc0d18f8efae0',
    messagingSenderId: '223211044513',
    projectId: 'der-gute-hirte',
    authDomain: 'der-gute-hirte.firebaseapp.com',
    storageBucket: 'der-gute-hirte.appspot.com',
    measurementId: 'G-QLRJB8BQ5M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3bNnzr3OiaJo-ITDZnaKqsur0JUTJaCk',
    appId: '1:223211044513:android:c8f84601dabfd8948efae0',
    messagingSenderId: '223211044513',
    projectId: 'der-gute-hirte',
    storageBucket: 'der-gute-hirte.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1qtW80yYTedroXYcqkWa-pHi7ntfX7XU',
    appId: '1:223211044513:ios:85a3cd03c677076c8efae0',
    messagingSenderId: '223211044513',
    projectId: 'der-gute-hirte',
    storageBucket: 'der-gute-hirte.appspot.com',
    iosBundleId: 'com.orthosoft.dergutehirte',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1qtW80yYTedroXYcqkWa-pHi7ntfX7XU',
    appId: '1:223211044513:ios:85a3cd03c677076c8efae0',
    messagingSenderId: '223211044513',
    projectId: 'der-gute-hirte',
    storageBucket: 'der-gute-hirte.appspot.com',
    iosBundleId: 'com.orthosoft.dergutehirte',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCD3hV2EI64zYHujQzdphFj64gVGyhJyqg',
    appId: '1:223211044513:web:0049295d1a08da888efae0',
    messagingSenderId: '223211044513',
    projectId: 'der-gute-hirte',
    authDomain: 'der-gute-hirte.firebaseapp.com',
    storageBucket: 'der-gute-hirte.appspot.com',
    measurementId: 'G-0M50DLP5QC',
  );
}