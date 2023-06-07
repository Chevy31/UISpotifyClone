import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modul1/layout/album2.dart';
import 'edit.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgColor(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1259734667214774273/pIRPG78R_400x400.jpg"),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Si Tampan",
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            Text(" "),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                color: Color(0xFF1dd860),
                onPressed: () async {
                  final result = await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => edit()));
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Text(
                      "1k",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Text(
                      "2.5k",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Playlists",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    "https://www.spotlistr.com/_next/static/images/example-grid-0b5284e054593c92985bead4380c8581.jpg",
                    width: 70.0,
                    height: 70.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      InkWell(
                        onTap: () async{
                          final result = await Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => (album2())
                              )
                          );
                        },
                        child: Text(
                          " Chill Music",
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ),
                      Text(
                        "  Followers : 999",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    "https://community.spotify.com/t5/image/serverpage/image-id/33106iC837B3225FFEBFFA/image-size/large?v=v2&px=999",
                    width: 70.0,
                    height: 70.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async{
                          final result = await Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => (album2())
                              )
                          );
                        },
                        child: Text(
                          " Galau Music",
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ),
                      Text(
                        "  Followers : 111",
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.network(
                    "https://static.wikia.nocookie.net/72dbe9d9-1097-4ba8-88af-4f686a3bba17/scale-to-width/755",
                    width: 70.0,
                    height: 70.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      InkWell(
                        onTap: (){},
                        child: Text(
                          " Meng Nugas",
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ),
                      Text(
                        "  Followers : 0",
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration bgColor() {
  return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.deepOrangeAccent.withOpacity(0.6),
          Colors.black.withOpacity(0.2),
          Colors.black.withOpacity(0.2),
        ],
        begin: Alignment.topCenter,
  ));
}
