import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF11151A),
        elevation: 0,
        title: const Text('Profile Connections'),
        // centerTitle: true,
      ),
      body:  WebView(
        initialUrl: 'https://znap.link/atuoha',
        onProgress: (int progress){
          const CircularProgressIndicator(color: Color(0xFF11151A));
        },
      ),
    );
  }
}
