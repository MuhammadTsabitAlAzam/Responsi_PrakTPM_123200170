import 'package:responsi_praktpm_123200170/list_news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DetailNewsScreen extends StatelessWidget {
  Posts post;
  DetailNewsScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              post.title!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(convertPubDate(post.pubDate!),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 5,
            ),
            FractionallySizedBox(
              widthFactor: 1.0,
              child: Image.network(
                post.thumbnail!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(post.description!,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await goToWebPage(post.link.toString());
                  },
                  child: Text("Baca Selengkapnya..."),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  String convertPubDate(String pubdate) {
    DateTime dateTime = DateTime.parse(pubdate);

    DateFormat formatter = DateFormat('EEEE, d MMMM yyyy');

    return formatter.format(dateTime);
  }
}
