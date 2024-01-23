import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_nook/model/news.dart';
import 'package:news_nook/services/remote_services.dart';
import 'package:news_nook/views/custom_widgets.dart';
import 'package:news_nook/views/news_details.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  News? news;
  bool isLoaded = false;
  getData() async {
    news = await RemoteServices().getnews();
    if (news != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomWidget().customDropdown(context),
      appBar: AppBar(
        title: const Text(
          'News Nook',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[300],
        elevation: 0,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemBuilder: (context, index) => Card(
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsDetails(
                              data: news!.articles![index],
                            )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //News Image
                  Image.network(news!.articles![index].urlToImage ??
                      'https://us.123rf.com/450wm/mattbadal/mattbadal1911/mattbadal191100006/mattbadal191100006.jpg?ver=6'),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 5, left: 8),
                    child: Text(
                      news!.articles![index].title ?? 'null',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 5, left: 8),
                    child: Text(
                      news!.articles![index].author ?? 'Unknown',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, bottom: 15, left: 8),
                        child: Text(
                          'Time: ${CustomWidget.formatDate(news!.articles![index].publishedAt)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          itemCount: news == null ? 0 : news!.articles!.length,
        ),
      ),
    );
  }

//Date format
}
