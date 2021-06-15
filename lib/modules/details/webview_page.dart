import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  final String initialUrl;
  final String title;

  const WebviewPage({Key? key, required this.initialUrl, this.title = ""})
      : super(key: key);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return IndexedStack(
      children: [
        Center(
          child: SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(),
          ),
        ),
        WebView(
          initialUrl: widget.initialUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webcontroller) {
            setState(() {
              isLoading = false;
            });
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.endsWith('.pdf')) {
              launch(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      ],
      index: isLoading ? 0 : 1,
    );
  }
}
