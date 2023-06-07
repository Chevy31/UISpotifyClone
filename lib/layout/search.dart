import 'package:flutter/material.dart';

import 'package:modul1/componets/searchBox.dart';
import 'package:modul1/componets/searchCards.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.black,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SearchBox(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Your top genres",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SearchCards(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Browse all",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SearchCards(),
                  SearchCards(),
                  SearchCards(),
                  SearchCards(),
                ],
              ),
            )
        )
      ],
    );
  }
}
