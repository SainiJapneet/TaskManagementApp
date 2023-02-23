// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCJ6f_NkJAt08gbvBnlOkuPpeFpDFSmWss',
    appId: '1:1002569260320:web:2fa9eb00a07468bd128b45',
    messagingSenderId: '1002569260320',
    projectId: 'taskmanagement-fl',
    authDomain: 'taskmanagement-fl.firebaseapp.com',
    storageBucket: 'taskmanagement-fl.appspot.com',
    measurementId: 'G-2V236LPE9P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCceDjNvWsnVGKulCniHL7jtdIYG2AnVPE',
    appId: '1:1002569260320:android:115e90b9f13587cd128b45',
    messagingSenderId: '1002569260320',
    projectId: 'taskmanagement-fl',
    storageBucket: 'taskmanagement-fl.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRCf-SdZmzqC6c7UsbTFoGvYMuggFAjUE',
    appId: '1:1002569260320:ios:ee74f918f0c965cd128b45',
    messagingSenderId: '1002569260320',
    projectId: 'taskmanagement-fl',
    storageBucket: 'taskmanagement-fl.appspot.com',
    iosClientId: '1002569260320-47oge2p31l3i9fsvjauce3ivcae421lv.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRCf-SdZmzqC6c7UsbTFoGvYMuggFAjUE',
    appId: '1:1002569260320:ios:ee74f918f0c965cd128b45',
    messagingSenderId: '1002569260320',
    projectId: 'taskmanagement-fl',
    storageBucket: 'taskmanagement-fl.appspot.com',
    iosClientId: '1002569260320-47oge2p31l3i9fsvjauce3ivcae421lv.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskManagementApp',
  );
}
