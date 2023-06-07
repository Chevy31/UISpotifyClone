import 'package:flutter/material.dart';

class SearchCards extends StatelessWidget {
  const SearchCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          CardGenre(),
          CardGenre(),
        ],
      ),
      Row(
        children: [
          CardGenre(),
          CardGenre(),
        ],
      ),
    ],);
  }
}

class CardGenre extends StatelessWidget {
  const CardGenre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 192,
        height: 80,
        color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Ballad",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
            Transform.rotate(
              angle: 0,
              child: Image(
                image: AssetImage('assets/noeasy.jpeg'),
                width: 80.0,
                height: 80.0,
              ),
            )
          ],

        ),
      ),
    );
  }
}
