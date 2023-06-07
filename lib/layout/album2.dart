import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modul1/layout/album2tambah.dart';
import 'package:modul1/base/repository.dart';
import 'package:modul1/base/modelJson.dart';
import 'package:auto_reload/auto_reload.dart';

class album2 extends StatefulWidget{
  @override
  _album2 createState() => _album2();
}
class _album2 extends State<album2>{
  List<model> listModel = [];
  repository repo = repository();

  getData() async{
    listModel = await repo.getData();
  }
  @override
  void initState() {
    getData();
    super.initState();

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playlist"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final result = await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => (album2Tambah())
              )
          );
        },
        child: FaIcon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: listModel.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  //kirim data
                  onTap: (){
                    Navigator.of(context).popAndPushNamed('/updateAlbum2',
                        arguments: [
                          listModel[index].id,
                          listModel[index].judul,
                          listModel[index].artis,
                        ]
                    );
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listModel[index].judul,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          listModel[index].artis,
                          style: TextStyle(fontSize: 18) ,
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: ()async{
                      bool res = await repo.deleteData(listModel[index].id);
                      if(res){
                        print("Delete Berhasil");
                      }else{
                        print("Delete Gagal");
                      }
                      setState(() {});
                    },
                    icon: FaIcon(Icons.delete_rounded, color: Colors.red,)
                )
              ],
            );
          }),
    );
  }
}