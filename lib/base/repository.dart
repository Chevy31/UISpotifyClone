import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modul1/base/modelJson.dart';

class repository{
  //link url cadangan https://modul6api.netlify.app/data.json
  //link url utama https://62bd211fbac21839b6fcad10.mockapi.io/judul

  final _baseUrl = 'https://62bd211fbac21839b6fcad10.mockapi.io/judul';

  Future getData() async{
    try{
      final response = await http.get(Uri.parse(_baseUrl));

      if(response.statusCode == 200){
        Iterable iter = jsonDecode(response.body);
        List<model> mod = iter.map((e) => model.fromJson(e)).toList();
        return mod;
      }
    }catch (e){
      print(e.toString());
    }
  }
  Future postData(String judul, String artis) async{
    try{
      final response = await http.post(Uri.parse(_baseUrl),
          body: {
            "judul":judul,
            "artis" : artis,
          }
      );
      if(response.statusCode == 201){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e.toString());
    }
  }
  Future putData(String id, String judul, String artis) async{
    try{
      final response = await http.put(Uri.parse('$_baseUrl/$id')
          ,body:{
            "judul":judul,
            "artis" : artis,
          }
      );
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e.toString());
    }


  }
  Future deleteData(String id) async{
    try{
      final response = await http.delete(Uri.parse('$_baseUrl/$id'));
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e.toString());
    }
  }
}