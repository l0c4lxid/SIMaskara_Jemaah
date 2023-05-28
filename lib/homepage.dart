import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'web.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final WebJamaah inAppBrowser = WebJamaah();
  String _url = "http://syaidandhika.my.id";
  int checkInt = 0;

  var options = InAppBrowserClassOptions(
    crossPlatform: InAppBrowserOptions(
        hideUrlBar: true, toolbarTopBackgroundColor: Colors.green),
    inAppWebViewGroupOptions: InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        javaScriptEnabled: true,
        cacheEnabled: true,
        transparentBackground: true,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[700], // Warna hijau untuk tema terang
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[700], // Warna hijau untuk tema gelap
        ),
      ),
      themeMode:
          ThemeMode.system, // Menggunakan tema berdasarkan preferensi perangkat
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('"MASKARA APPS"'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Center(
                child: Image.asset(
                  'images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 30), // Jarak antara logo dan tombol
              MaterialButton(
                // ... Tombol "Buka SiMasjid" dan kode lainnya
                onPressed: () {
                  inAppBrowser.openUrlRequest(
                    urlRequest: URLRequest(url: Uri.parse(_url)),
                    options: options,
                  );
                },
                child: Text(
                  'Buka SiMaskara',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green[700],
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
