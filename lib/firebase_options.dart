// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBomAy7nuaHwnftA0yX5nSaZb8qGfNA97A',
    appId: '1:672882184534:android:f17b11c8e69817dc8006f7',
    messagingSenderId: '672882184534',
    projectId: 'envairo-1ffd9',
    storageBucket: 'envairo-1ffd9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyvda4HS0uJjUvP2DYPDKszY9cgFBtC9A',
    appId: '1:672882184534:ios:bf8f19fcb60d5a408006f7',
    messagingSenderId: '672882184534',
    projectId: 'envairo-1ffd9',
    storageBucket: 'envairo-1ffd9.appspot.com',
    iosClientId:
        '672882184534-urq904crgsmc66330jhqf3rmpemlg8mh.apps.googleusercontent.com',
    iosBundleId: 'com.google.developers.envairo.envairo',
  );
}
