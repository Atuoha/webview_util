import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'navigation_buttons.dart';

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

  var _loadingPercentage = 0;
  String url = 'https://znap.link/atuoha';
  final Color color = const Color(0xFF11151A);
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        elevation: 0,
        title: const Text('Profile Connections'),
        centerTitle: true,
        actions: [
          NavigationButtons(
            controller: controller,
          )
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: url,
            onProgress: (int progress) {
              setState(() {
                _loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _loadingPercentage = 100;
              });
            },
          ),
          _loadingPercentage < 100
              ? LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  minHeight: 10,
                  value: _loadingPercentage / 100.0,
                  color: color,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
