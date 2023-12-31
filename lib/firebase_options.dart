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
    apiKey: 'AIzaSyCza_WQYJ8I3-pOsF6ppd7uH8_WtMlNiv0',
    appId: '1:231631251146:web:406cbbcf474f30d357f633',
    messagingSenderId: '231631251146',
    projectId: 'health-app-80e19',
    authDomain: 'health-app-80e19.firebaseapp.com',
    storageBucket: 'health-app-80e19.appspot.com',
    measurementId: 'G-KCKRJ65RTC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7cEkfY3XAAfRGnBKrAbSb1D08TB_Lr0c',
    appId: '1:231631251146:android:b37740bfa3506ac157f633',
    messagingSenderId: '231631251146',
    projectId: 'health-app-80e19',
    storageBucket: 'health-app-80e19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCA9xoan62Fj4PnUtyhMy0eHS0Qa_fuyPU',
    appId: '1:231631251146:ios:f7101585b6b3a84557f633',
    messagingSenderId: '231631251146',
    projectId: 'health-app-80e19',
    storageBucket: 'health-app-80e19.appspot.com',
    iosBundleId: 'com.example.healthApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCA9xoan62Fj4PnUtyhMy0eHS0Qa_fuyPU',
    appId: '1:231631251146:ios:4b48f21d16d828c857f633',
    messagingSenderId: '231631251146',
    projectId: 'health-app-80e19',
    storageBucket: 'health-app-80e19.appspot.com',
    iosBundleId: 'com.example.healthApp.RunnerTests',
  );
}
