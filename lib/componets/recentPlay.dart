import 'package:flutter/material.dart';

class recentPlay extends StatelessWidget {
  const recentPlay({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Column(
      children: [
        cardRow(),
        cardRow(),
        cardRow(),
      ],
    );
  }
}

class cardRow extends StatelessWidget {
  const cardRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            cardBuild(
              "https://i.pinimg.com/originals/fe/5c/36/fe5c36b8b4cbaa728f3c03a311e002cb.png",
              "Liked Songs",
            ),
            cardBuild(
              "https://i.pinimg.com/originals/fe/5c/36/fe5c36b8b4cbaa728f3c03a311e002cb.png",
              "Liked Songs",
            ),
          ],
        )
      ],
    );
  }
}

Card cardBuild(String img, String txt) {
  return Card(
    color: Colors.grey[800],
    child: Container(
      width: 170,
      child: Row(
        children: [
          Image(
            image: NetworkImage(img),
            width: 50,
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              14,
              17,
              25,
              17,
            ),
            child: Text(txt),
          )
        ],
      ),
    ),
  );
}
