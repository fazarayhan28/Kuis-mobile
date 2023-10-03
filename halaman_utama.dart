import 'package:flutter/material.dart';
import 'package:flutter_login/halaman_detail.dart';
import 'package:flutter_login/data_buku.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Data Buku'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2),
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku lokasi = listBuku[index];
          return InkWell(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => HalamanDetail(lokasi: lokasi),
              ),
              );
            },
          child: Card(
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Image.network(lokasi.imageLink,
                        fit: BoxFit.fill,
                      ),
                  ),
                  Text(lokasi.title),
                ],
              ),
            ),
          ),
            );
      }
      ),
    );
  }
}
