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
    apiKey: 'AIzaSyBK7FqEIiYEyFNBys1wwAMofYnhzm4HCDI',
    appId: '1:874691514731:web:7180b492b0a27b0afbbc2e',
    messagingSenderId: '874691514731',
    projectId: 'zarityblog',
    authDomain: 'zarityblog.firebaseapp.com',
    storageBucket: 'zarityblog.appspot.com',
    measurementId: 'G-W93FDW10SN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKHMn3QcxxrumteN2FTe3C55ETj559sWY',
    appId: '1:874691514731:android:95ac8fc3fbc22121fbbc2e',
    messagingSenderId: '874691514731',
    projectId: 'zarityblog',
    storageBucket: 'zarityblog.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAko20p9p55rFGm--Sgy9-veYht73ZKNfM',
    appId: '1:874691514731:ios:0eb15099a811bcd6fbbc2e',
    messagingSenderId: '874691514731',
    projectId: 'zarityblog',
    storageBucket: 'zarityblog.appspot.com',
    iosBundleId: 'com.example.zarityblog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAko20p9p55rFGm--Sgy9-veYht73ZKNfM',
    appId: '1:874691514731:ios:0eb15099a811bcd6fbbc2e',
    messagingSenderId: '874691514731',
    projectId: 'zarityblog',
    storageBucket: 'zarityblog.appspot.com',
    iosBundleId: 'com.example.zarityblog',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBK7FqEIiYEyFNBys1wwAMofYnhzm4HCDI',
    appId: '1:874691514731:web:9cb5abd14f3f3d8afbbc2e',
    messagingSenderId: '874691514731',
    projectId: 'zarityblog',
    authDomain: 'zarityblog.firebaseapp.com',
    storageBucket: 'zarityblog.appspot.com',
    measurementId: 'G-KJFJYNFPJ3',
  );
}