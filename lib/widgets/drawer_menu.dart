import 'package:flutter/material.dart';
import 'package:samachar/models/media_name.dart';
import 'package:samachar/pages/media_news.dart';

class DrawMenu extends StatelessWidget {
  Function _submit(BuildContext context, String url) {
    return (BuildContext context, String url) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MediaNews(
                    url: url,
                  )));
    };
  }

  List media = [
    MediaName(
        name: 'CNN', icon: Icons.bubble_chart, url: 'https://us.cnn.com/'),
    MediaName(
        name: 'NY Times',
        icon: Icons.bubble_chart,
        url: 'https://www.nytimes.com/'),
    MediaName(
        name: 'NDTV', icon: Icons.bubble_chart, url: 'https://www.ndtv.com/'),
    MediaName(
        name: 'REPUBLIC',
        icon: Icons.bubble_chart,
        url: 'https://www.republicworld.com/'),
    MediaName(
        name: 'Dainik bhaskar',
        icon: Icons.bubble_chart,
        url: 'https://www.bhaskar.com/'),
    MediaName(
        name: 'Quint',
        icon: Icons.bubble_chart,
        url: 'https://www.thequint.com/'),
    MediaName(
        name: 'Quint',
        icon: Icons.bubble_chart,
        url: 'https://www.thequint.com/'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Drawer(
        elevation: 20,
        child: ListView.builder(
          itemCount: media.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                GestureDetector(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          media[index].icon,
                          size: 50,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          media[index].name,
                        ),
                      ],
                    ),
                    onTap: () {
                      _submit(context, 'www.google.com');
                    }),
                Divider(
                  color: Colors.white60,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
