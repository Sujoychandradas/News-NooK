import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({Key? key, required this.data}) : super(key: key);

  // final Completer<WebViewController> _controller =
  var data;

  @override
  Widget build(BuildContext context) {
    // final controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..loadRequest(Uri.parse(data!.url ?? 'https://www.google.com'));
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
          title: const Text(
            'News Details',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[300],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              data!.urlToImage ??
                  'https://us.123rf.com/450wm/mattbadal/mattbadal1911/mattbadal191100006/mattbadal191100006.jpg?ver=6',
              height: 200,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title ?? 'Null',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    data.author ?? 'Null',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.redAccent),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    data.publishedAt ?? 'Null',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.green),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    data.description ?? 'Null',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    data.content ?? 'Null',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
            // Container(
            //     height: MediaQuery.of(context).size.height * 0.7,
            //     child: WebViewWidget(
            //       controller: controller,
            //     )),
          ],
        ),
      ),
    );
  }
}
