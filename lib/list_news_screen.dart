import 'package:responsi_praktpm_123200170/api_data_source.dart';
import 'package:responsi_praktpm_123200170/list_news_model.dart';
import 'package:responsi_praktpm_123200170/detail_news_screen.dart';
import 'package:flutter/material.dart';

class PageListNews extends StatelessWidget {
  String kategori;
  PageListNews({Key? key, required this.kategori}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REPUBLIKA ${kategori.toUpperCase()}"),
        centerTitle: true,
      ),
      body: _builListUsersBody(kategori),
    );
  }
}

Widget _builListUsersBody(String kategori) {
  return Container(
    child: FutureBuilder(
      future: ApiDataSource.instance.LoadNews(kategori),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }

        if (snapshot.hasData) {
          ListNewsModel listNewsModel = ListNewsModel.fromJson(snapshot.data);
          return _buildSuccesSection(listNewsModel);
        }

        return _buildLoadingSection();
      },
    ),
  );
}

Widget _buildSuccesSection(ListNewsModel news) {
  return ListView.builder(
    itemCount: news.data!.posts!.length,
    itemBuilder: (context, index) {
      return _buildItemsUsers(news.data!.posts![index], context);
    },
  );
}

Widget _buildItemsUsers(Posts news, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailNewsScreen(post: news)),
      );
    },
    child: Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
                news.title!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
              )
          ),
          SizedBox(
            width: 10,
          ),

          Container(
              width: MediaQuery.of(context).size.width/3,
              child: Image.network(news.thumbnail!)
          ),
        ],
      ),
    ),
  );
}

Widget _buildErrorSection() {
  return const Text("ERROR");
}

Widget _buildLoadingSection() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
