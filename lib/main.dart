import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() => runApp(const WebViewUtil());

class WebViewUtil extends StatelessWidget {
  const WebViewUtil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MainScreen(),
    );
  }
}
