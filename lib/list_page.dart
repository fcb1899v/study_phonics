import 'package:flutter/material.dart';
import 'main_page.dart';
import 'main_widget.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {

  late List<String> phonicsList;

  @override
  void initState() {
    super.initState();
    setState(() {
      phonicsList = [
        "a", "a'", "b", "c", "c'", "d", "e", "f", "g", "g'", "h",
        "i", "i'", "j", "k", "l", "m", "n", "o", "p", "q", "r",
        "s", "s'", "t", "u", "v", "w", "x", "y", "z",
        "er", "ir", "or", "ur", "ear'", "ie", "igh", "-y", "_i_e",
        "ou", "ow", "ēē", "ēā", "īē", "ey", "_e_e", "eer", "ear",
        "ue", "ui", "ew", "ōō", "ōū", "_u_e", "oo",
        "ai", "ay", "_a_e", "air", "ea",
        "au", "aw", "our", "oy", "oa", "ōw", "all",
        "ph", "ch", "sh", "th", "th'", "wh", "ck", "ng", "lly"
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: appBarTitle(),
          brightness: Brightness.dark,
          backgroundColor: HexColor('FF69B4'),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 4, // 1行に表示する数
          crossAxisSpacing: 4.0, // 縦スペース
          mainAxisSpacing: 4.0, // 横スペース
          //shrinkWrap: true,
          children: List.generate(phonicsList.length, (index) {
            return gridWordList(index);
          })
        ),
      ),
    );
  }

  Widget gridWordList(index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
      ),
      child:GridTile(
        child: TextButton(
          child: Text(phonicsList[index],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPage(index)
              ),
            );
          },
        ),
      ),
    );
  }
}