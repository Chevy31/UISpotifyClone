import 'package:flutter/material.dart';
import 'package:modul1/base/repository.dart';

class album2Tambah extends StatefulWidget{
  @override
  _album2Tambah createState() => _album2Tambah();
}
class _album2Tambah extends State<album2Tambah>{
  TextEditingController _judulControl = TextEditingController();
  TextEditingController _artisControl = TextEditingController();
  repository repo = repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Tambah Musik"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _judulControl,
              decoration: InputDecoration(
                  hintText: "Judul Lagu"
              ),
            ),
            TextField(
              controller: _artisControl,
              decoration: InputDecoration(
                  hintText: "Judul Lagu"
              ),
            ),
            ElevatedButton(
                onPressed: () async{
                  bool res = await repo.postData(
                      _judulControl.text,
                      _artisControl.text);
                  if(res){
                    Navigator.of(context).popAndPushNamed('/screenAlbum2');
                  }else{
                    print("Tambah Musik Gagal");
                  }
                },
                child: Text("Submit")
            )
          ],
        ),
      ),
    );
  }
}