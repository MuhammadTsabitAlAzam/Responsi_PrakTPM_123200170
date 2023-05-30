import 'package:responsi_praktpm_123200170/list_news_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              'https://static.republika.co.id/files/images/logo.png',
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/4,
            ),
          ),
          SizedBox(height: 150),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageListNews(kategori: 'terbaru'),
                          ),
                        );
                      },
                      child: Text('TERBARU'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageListNews(kategori: 'daerah'),
                          ),
                        );
                      },
                      child: Text('DAERAH'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageListNews(kategori: 'internasional'),
                          ),
                        );
                      },
                      child: Text('INTERNASIONAL'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageListNews(kategori: 'islam'),
                          ),
                        );
                      },
                      child: Text('ISLAM'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
