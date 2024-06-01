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
    apiKey: 'AIzaSyBN7pVacmqCiD4t4YPm5m8NGlCbtqo0F1Q',
    appId: '1:938549557277:web:a9326054d210c66b50aef4',
    messagingSenderId: '938549557277',
    projectId: 'momentmashup',
    authDomain: 'momentmashup.firebaseapp.com',
    storageBucket: 'momentmashup.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCy766-gHTyqWKevhlkySSLqnFifdMsTwY',
    appId: '1:938549557277:android:8ddcd440b935140350aef4',
    messagingSenderId: '938549557277',
    projectId: 'momentmashup',
    storageBucket: 'momentmashup.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlJ1P1lZttiwfGkh8-0dE2vCyZ81DAjQI',
    appId: '1:938549557277:ios:0585c01e4394a39950aef4',
    messagingSenderId: '938549557277',
    projectId: 'momentmashup',
    storageBucket: 'momentmashup.appspot.com',
    iosBundleId: 'com.example.momentmashupDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlJ1P1lZttiwfGkh8-0dE2vCyZ81DAjQI',
    appId: '1:938549557277:ios:0585c01e4394a39950aef4',
    messagingSenderId: '938549557277',
    projectId: 'momentmashup',
    storageBucket: 'momentmashup.appspot.com',
    iosBundleId: 'com.example.momentmashupDemo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBN7pVacmqCiD4t4YPm5m8NGlCbtqo0F1Q',
    appId: '1:938549557277:web:e76c8007d0a1659750aef4',
    messagingSenderId: '938549557277',
    projectId: 'momentmashup',
    authDomain: 'momentmashup.firebaseapp.com',
    storageBucket: 'momentmashup.appspot.com',
  );
}