import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'extension.dart';
import 'constant.dart';
import 'main_page.dart';
import 'main_widget.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {

  late double width;
  late double height;
  late List<String> phonicsList;

  @override
  void initState() {
    super.initState();
    setState(() => phonicsList = allPhonics);
  }

  @override
  void didChangeDependencies() {
    "call didChangeDependencies".debugPrint();
    super.didChangeDependencies();
    setState((){
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
    "width: $width, height: $height".debugPrint();
  }

  @override
  void didUpdateWidget(oldWidget) {
    "call didUpdateWidget".debugPrint();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    "call deactivate".debugPrint();
    super.deactivate();
  }

  @override
  void dispose() {
    "call dispose".debugPrint();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "sfPro"
        ),
        home: Scaffold(
          appBar: AppBar(
            title: appBarTitle(),
            backgroundColor: pinkColor,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: GridView.count(
            crossAxisCount: width.listRowNumber(), // 1行に表示する数
            crossAxisSpacing: listMargin, // 縦スペース
            mainAxisSpacing: listMargin, // 横スペース
            //shrinkWrap: true,
            children: List.generate(numberPhonics, (i) => gridWordList(i))
          ),
        ),
      );

  Widget gridWordList(int i) =>
      Container(
        padding: const EdgeInsets.all(listPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: blueColor),
        child:GridTile(
          child: TextButton(
            child: Text(phonicsList[i],
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: listCharSize,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainPage(i)),
              );
            },
          ),
        ),
      );
}

