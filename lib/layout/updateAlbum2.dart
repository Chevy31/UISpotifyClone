import 'package:flutter/material.dart';
import 'package:modul1/base/repository.dart';

class album2Update extends StatefulWidget{
  @override
  _album2Update createState() => _album2Update();
}
class _album2Update extends State<album2Update>{
  TextEditingController _judulControl = TextEditingController();
  TextEditingController _artisControl = TextEditingController();
  repository repo = repository();
  @override
  Widget build(BuildContext context) {
    //tangkap data
    final argument = ModalRoute.of(context)?.settings.arguments as List<String>;
    if(argument[1].isNotEmpty){
      _judulControl.text = argument[1];
    }    if(argument[2].isNotEmpty){
      _artisControl.text = argument[2];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text ("Update Musik"),
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
                  bool res = await repo.putData(
                      argument[0],
                      _judulControl.text,
                      _artisControl.text
                  );
                  if(res){
                    Navigator.popAndPushNamed(context, '/screenAlbum2');
                  }else{
                    print("Update Musik Gagal");
                    Navigator.of(context).popAndPushNamed('/screenAlbum2');
                  }
                },
                child: Text("Update")
            )
          ],
        ),
      ),
    );
  }
}