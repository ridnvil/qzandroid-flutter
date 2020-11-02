import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
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
  double proggressLoad = 0;
  bool loading = false;

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
          child: Stack(
            children: [
              InAppWebView(
                initialUrl: "https://qzscore.com",
                onEnterFullscreen: (controller) {
                  controller.getScale();
                },
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                        horizontalScrollBarEnabled: false,
                        javaScriptCanOpenWindowsAutomatically: true,
                        javaScriptEnabled: true,
                        supportZoom: false,
                        mediaPlaybackRequiresUserGesture: true,
                        debuggingEnabled: true)),
                onWebViewCreated: (webview) {
                  controller = webview;
                  print(webview);
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    loading = true;
                  });
                },
                onLoadStop: (controller, url) {
                  setState(() {
                    loading = false;
                  });
                },
                onProgressChanged:
                    (InAppWebViewController webview, int proggress) {
                  setState(() {
                    loading = true;
                    proggressLoad = proggress / 100;
                  });
                },
              ),
              loading
                  ? LinearProgressIndicator(
                      value: proggressLoad,
                    )
                  : Text(''),
            ],
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
