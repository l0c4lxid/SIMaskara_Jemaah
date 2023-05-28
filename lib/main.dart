import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await Permission.storage.request();
  await Permission.mediaLibrary.request();
  // ask for storage permission on app create

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selamat Datang Jamaah Karamah',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          visualDensity: VisualDensity.standard),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
