import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'main_widget.dart';
import 'constant.dart';
import 'extension.dart';
import 'admob.dart';

class MainPage extends StatefulWidget {
  const MainPage(this.index);
  final int index;
  @override
  _MainPageState createState() => _MainPageState(index);
}

class _MainPageState extends State<MainPage> {
  int index;
  _MainPageState(this.index);

  late double width;
  late double height;
  late List<String> phonicsList;
  late String char;
  late List<String> word;
  late List<String> picture;
  late List<String> sound;
  late BannerAd? myBanner;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (Platform.isAndroid) myBanner = AdmobService().getBannerAd()!;
    });
    _setReturn();
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
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: whiteColor
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
          title: appBarTitle(),
        ),
        body: Container(
          padding: mainPadding(width),
          child: Column(children: [
            Spacer(flex: 1),
            alphabetChar(width, char),
            Spacer(flex: 1),
            Row(children: [
              alphabetWord(0),
              Spacer(),
              alphabetWord(1),
            ]),
            SizedBox(height: width * alphabetSpaceRate),
            operationButtons(),
            Spacer(flex: 3),
            if (Platform.isAndroid) adMobWidget(context, myBanner!),
          ]),
        ),
      );

  Widget alphabetWord(int num) =>
      SizedBox(
        width: width * alphabetWidthRate,
        child: Column(children: [
          TextButton(
            onPressed: () => sound[num].speakText(context),
            child: wordView(width, word, num),
          ),
          SizedBox(height: width * alphabetSpaceRate),
          TextButton(
            onPressed: () => sound[num].speakText(context),
            child: pictureView(width, picture[num]),
          ),
          SizedBox(height: width * alphabetSpaceRate),
          ElevatedButton(
            onPressed: () => sound[num].speakText(context),
            style: audioButtonStyle(),
            child: audioButton(width)
          ),
        ])
      );

  Widget operationButtons() =>
      SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _setReturn(),
              style: operationButtonStyle(),
              child: operationButton(width, Icons.keyboard_return)
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => _setShuffle(),
              style: operationButtonStyle(),
              child: operationButton(width, Icons.shuffle)
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => _setBack(),
              style: operationButtonStyle(),
              child: operationButton(width, Icons.arrow_back)
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => _setForward(),
              style: operationButtonStyle(),
              child: operationButton(width, Icons.arrow_forward)
            ),
          ]
        ),
      );

  _setReturn() {
    setState(() => phonicsList = [
      "a", "a'", "b", "c", "c'", "d", "e", "f", "g", "g'", "h", "i", "i'", "j", "k",
      "l", "m", "n", "o", "p", "q", "r", "s", "s'", "t", "u", "v", "w", "x", "y", "z",
      "er", "ir", "or", "ur", "ear'", "ie", "igh", "-y", "_i_e", "ou", "ow",
      "ēē", "ēā", "īē", "ey", "_e_e", "eer", "ear", "ue", "ui", "ew", "ōō", "ōū",
      "_u_e", "oo", "ai", "ay", "_a_e", "air", "ea", "au", "aw", "our", "oy",
      "oa", "ōw", "all", "ph", "ch", "sh", "th", "th'", "wh", "ck", "ng", "lly"
    ]);
    _setNewWord();
  }

  _setShuffle() {
    setState(() => phonicsList.shuffle());
    _setNewWord();
  }

  _setBack() {
    setState(() {
      phonicsList.insert(0, phonicsList[phonicsList.length - 1]);
      phonicsList.removeAt(phonicsList.length - 1);
    });
    _setNewWord();
  }

  _setForward() {
    setState(() {
      phonicsList.insert(phonicsList.length, phonicsList[0]);
      phonicsList.removeAt(0);
    });
    _setNewWord();
  }

  _setNewWord() {
    setState(() {
      char = phonicsList[index];
      word = phonicsList[index].phonicsWord();
      picture = phonicsList[index].phonicsPicture();
      sound = word.wordSound();
    });
    "$char, ${word[0]}${word[1]}${word[2]}, ${word[3]}${word[4]}${word[5]}".debugPrint();
  }
}

