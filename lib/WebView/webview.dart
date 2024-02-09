import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewShow extends StatefulWidget {
  const WebViewShow({Key? key, required this.urlImage}) : super(key: key);
  final String urlImage;

  @override
  State<WebViewShow> createState() => _WebViewShowState();
}

class _WebViewShowState extends State<WebViewShow> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.urlImage));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return widget.urlImage == null
        ? const Scaffold(
            body: Center(
                child: Text(
              'Sorry, That Is Not Found Now',
              style: TextStyle(fontSize: 24),
            )),
          )
        : Scaffold(
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : WebViewWidget(
                    controller: controller,
                  ),
          );
  }
}
