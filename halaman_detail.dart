import 'package:flutter/material.dart';
import 'package:flutter_login/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku lokasi;

  const HalamanDetail({super.key, required this.lokasi});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.lokasi.title),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              widget.lokasi.isBookmarked = !widget.lokasi.isBookmarked;

            });
          },
              icon: (widget.lokasi.isBookmarked)
        ? const Icon(Icons.bookmarks)
                  : Icon(Icons.bookmarks_outlined),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.20),
        child: Center(
          child: Column(
            children: [
              Text(widget.lokasi.title, style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                  child: Image.network(widget.lokasi.imageLink)),
              Container(child: Text(widget.lokasi.title)),
              Container(child: Text(widget.lokasi.author)),
              Container(child: Text(widget.lokasi.country)),
              Container(child: Text(widget.lokasi.language)),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _launchUrl((widget.lokasi.link));
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
