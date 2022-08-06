import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final Completer<WebViewController> controller;

  showMessage(BuildContext context, content, Color bgColor) {
    return ScaffoldMessenger(
      child: SnackBar(
        content: Text(
          content,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: bgColor,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.future,
      builder: (context, AsyncSnapshot<WebViewController> snapshot) {
        final WebViewController? controller = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done ||
            controller == null) {
          return Row(
            children: const [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.chevron_left,
                  color:Colors.white,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.chevron_right,
                  color:Colors.white,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.replay,
                  color:Colors.white,
                ),
              ),
            ],
          );
        }

        return Row(
          children: [
            IconButton(
              onPressed: () async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                } else {
                  showMessage(
                    context,
                    'Can not go back',
                    Colors.red,
                  );
                }
              },
              icon: const Icon(
                Icons.chevron_left,
                color:Colors.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (await controller.canGoForward()) {
                  controller.goForward();
                } else {
                  showMessage(
                    context,
                    'Can not go forward',
                    Colors.red,
                  );
                }
              },
              icon: const Icon(
                Icons.chevron_right,
                color:Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => controller.reload(),
              icon: const Icon(
                Icons.replay,
                color:Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
