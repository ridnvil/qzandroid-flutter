import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/InAppBrowser': (context) => InAppBrowserScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InAppWebViewController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.goBack();
      },
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialUrl: "https://qzscore.com",
            initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                    javaScriptCanOpenWindowsAutomatically: true,
                    javaScriptEnabled: true,
                    supportZoom: false,
                    mediaPlaybackRequiresUserGesture: false,
                    debuggingEnabled: true)),
            onWebViewCreated: (webview) {
              controller = webview;
              print(webview);
            },
          ),
        ),
      ),
    );
  }
}

class InAppBrowserScreen extends StatefulWidget {
  @override
  _InAppBrowserScreenState createState() => _InAppBrowserScreenState();
}

class _InAppBrowserScreenState extends State<InAppBrowserScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
