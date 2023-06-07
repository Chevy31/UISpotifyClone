import 'package:flutter/material.dart';
import 'package:modul1/componets/recentPlay.dart';
import 'package:modul1/componets/Recomended.dart';
import 'package:modul1/layout/profile.dart';
import 'package:modul1/layout/search.dart';

class navBar extends StatefulWidget {
  _navBar createState() => _navBar();
}

class _navBar extends State<navBar> {
  int index = 0;

  //bottom navigation item
  List<BottomNavigationBarItem> navigationIcons() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        label: "Profile",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        label: "Search",
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        backgroundColor: Colors.white10,
        iconSize: 20,
        onTap: (int val) {
          setState(() {
            index = val;
          });
        },
        type: BottomNavigationBarType.fixed,
        elevation: 50.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: navigationIcons(),
      ),
      body: Stack(
        children: [
          render(
            0, home(),),
          render(1, Profile(),),
          render(2, Search())
        ],
      ),

    );
  }

  //home
  Widget home() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: bgColor(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                recentPlay(),
                SizedBox(height: 20.0),
                Text(
                  "Today Biggest Hits",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Recomended(
                  url:
                  "https://en.meming.world/images/en/thumb/7/7f/Polish_Jerry.jpg/300px-Polish_Jerry.jpg",
                ),
                Text(
                  "Recomended For Today",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Recomended(
                  url:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQpeq7iw5s7BmPgJcDqogaqVhd2miHvNfc5g&usqp=CAU",
                ),
                Text(
                  "Your Top Mixes",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Recomended(
                  url:
                  "https://static.wikia.nocookie.net/dc673c28-0c93-4acf-b7ef-f330135827e0",
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget header(){
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Good Morning",
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.settings),
        ],
      ),
    );
  }

  //background color
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

  //navbar render
  Widget render(int tabInx, Widget view) {
    return IgnorePointer(
      ignoring: index != tabInx,
      child: Opacity(
        opacity: index == tabInx ? 1 : 0,
        child: view,
      ),
    );
  }
}