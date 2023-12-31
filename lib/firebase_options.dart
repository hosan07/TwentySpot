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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCdWZJRcCbp1Y4o_Dgk_yAnpoAx4cLR89g',
    appId: '1:442816396250:web:15e0333a41d08995741ee3',
    messagingSenderId: '442816396250',
    projectId: 'apppro-d35ae',
    authDomain: 'apppro-d35ae.firebaseapp.com',
    storageBucket: 'apppro-d35ae.appspot.com',
    measurementId: 'G-VZTCC277WE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl1xSpKkfQnFQ-CCb1z9Hjpmka66b4T5o',
    appId: '1:442816396250:android:1087cf2f5792ca17741ee3',
    messagingSenderId: '442816396250',
    projectId: 'apppro-d35ae',
    storageBucket: 'apppro-d35ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-Hc4PkIlKYSpQ4culWgNshph9KmqR0Is',
    appId: '1:442816396250:ios:0f8641f2efbcbe19741ee3',
    messagingSenderId: '442816396250',
    projectId: 'apppro-d35ae',
    storageBucket: 'apppro-d35ae.appspot.com',
    iosClientId: '442816396250-bfg2d47nj1cf85tnj6eikqe3qfgei6pr.apps.googleusercontent.com',
    iosBundleId: 'com.example.twentyspot',
  );
}
