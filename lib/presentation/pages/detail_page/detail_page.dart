import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: ListView(
          children: [
            Column(
              children: [
                AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.network(
                      'src',
                    )),
                Text('영화제목+개봉일'),
                Text('태그라인'),
                Text('러닝타임'),
                Text('카테고리'),
                Text('영화설명'),
                Divider(
                  color: Colors.grey, // 구분선 색상
                  thickness: 1.0,
                ),
                Text('흥행정보'),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(width: 2),
                        ),
                        child: Center(child: Text('$index')),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(width: 2),
                        ),
                        child: Center(child: Text('$index')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
