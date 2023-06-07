import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.0,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 10.0,
            height: 10.0,
          ),
          Flexible(
            child: new TextField(
              decoration: const InputDecoration(hintText: "Artist, Song, or Podcast",
                hintStyle: TextStyle(color: Colors.black)
            ),
              style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
