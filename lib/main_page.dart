import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'admob_banner.dart';
import 'constant.dart';
import 'extension.dart';

class MainPage extends HookConsumerWidget {
  final int index;
  MainPage({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final FlutterTts flutterTts = FlutterTts();
    final counter = useState(index);
    final phonicsList = useState(allPhonics);
    var char = phonicsList.value[counter.value];
    var word = char.phonicsWord();
    var picture = char.phonicsPicture();
    var sound = char.phonicsWord().wordSound();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await flutterTts.setSharedInstance(true);
        await flutterTts.setIosAudioCategory(
          IosTextToSpeechAudioCategory.playback,
          [
            IosTextToSpeechAudioCategoryOptions.allowBluetooth,
            IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
            IosTextToSpeechAudioCategoryOptions.mixWithOthers,
            IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
          ]
        );
        await flutterTts.setVolume(1);
        await flutterTts.setLanguage("en-US");
        await flutterTts.setSpeechRate(0.5);
        "Counter: ${counter.value}, PhonicsList: ${phonicsList.value}".debugPrint();
      });
      return null;
    }, []);

    //0: Reset, 1: Shuffle, 2: Back, 3:Next
    final icons = [
      Icons.keyboard_return,
      Icons.shuffle,
      Icons.arrow_back,
      Icons.arrow_forward
    ];

    operations(int i) {
      final List<String> list = List<String>.from(allPhonics);
      if (i == 1) list.shuffle();
      counter.value =
        (i == 2) ? counter.value.backNumber():
        (i == 3) ? counter.value.nextNumber():
        index;
      phonicsList.value =
        (i == 0) ? allPhonics:
        (i == 1) ? list:
        phonicsList.value;
      "Counter: ${counter.value}, PhonicsList: ${phonicsList.value}".debugPrint();
    }

    useEffect(() {
      char = phonicsList.value[counter.value];
      word = char.phonicsWord();
      picture = char.phonicsPicture();
      sound = char.phonicsWord().wordSound();
      return null;
    }, [counter.value, phonicsList.value]);

    return Scaffold(
      ///AppBar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
            color: whiteColor,
            shadows: [myShadow()],
          ),
          onPressed: () => Navigator.pop(context, true),
        ),
        backgroundColor: blueColor,
        title: Text(myTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: appBarFontSize,
            color: whiteColor,
            shadows: [myShadow()],
          ),
        ),
        centerTitle: true,
      ),
      ///Body
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: context.width() * horizontalMarginRate),
        child: Column(children: [
          Spacer(flex: 1),
          ///Char
          GestureDetector(
            onTap: () => char.charSound().speakText(context, flutterTts),
            child: Row(children: [ for (int i = 0; i < 2; i++) ... {
              if (i == 0 || char.length == 1) Container(
                width: context.charWidth(char),
                margin: EdgeInsets.only(bottom: context.height() * wordSpaceRate),
                alignment: Alignment.center,
                child: Text((i == 0) ? char: char.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width() * charSizeRate,
                    shadows: [myShadow()],
                  ),
                ),
              ),
              if (i == 0 && char.length == 1) Spacer(flex: 1),
            }]),
          ),
          Row(children: [ for (int i = 0; i < 2; i++) ... {
            GestureDetector(
              onTap: () => sound[i].speakText(context, flutterTts),
              child: Container(
                width: context.width() * wordWidthRate,
                margin: EdgeInsets.only(bottom: context.height() * wordSpaceRate),
                child: Column(children: [
                  ///Word
                  Container(
                    margin: EdgeInsets.only(bottom: context.height() * wordSpaceRate),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: context.width() * wordSizeRate,
                          shadows: [myShadow()],
                        ),
                        children: [ for (int j = 0; j < 3; j++)
                          TextSpan(text: word[3 * i + j],
                            style: (j == 1) ? TextStyle(
                              color: pinkColor,
                              decoration: TextDecoration.underline,
                            ): null
                          ),
                        ],
                      ),
                    ),
                  ),
                  ///Picture
                  Container(
                    width: context.picWidth(),
                    height: context.picHeight(),
                    margin: EdgeInsets.only(bottom: context.height() * wordSpaceRate),
                    child: Image.asset(picture[i]),
                  ),
                  ///Audio Button
                  Container(
                    width: context.width() * largeButtonWidthRate,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(buttonRadius),
                      boxShadow: [myShadow()],
                    ),
                    child: Icon(Icons.audiotrack,
                      color: whiteColor,
                      size: buttonIconSize,
                      shadows: [myShadow()],
                    ),
                  )
                ]),
              )
            ),
            if (i == 0) Spacer(flex: 1),
          }]),
          Row(children: [ for (int i = 0; i < 4; i++) ... {
            ///Operation Button
            GestureDetector(
              onTap: () => operations(i),
              child: Container(
                width: context.width() * smallButtonWidthRate,
                height: buttonHeight,
                  decoration: BoxDecoration(
                    color: pinkColor,
                    borderRadius: BorderRadius.circular(buttonRadius),
                    boxShadow: [myShadow()],
                  ),
                  child: Icon(icons[i],
                    color: whiteColor,
                    size: buttonIconSize,
                    shadows: [myShadow()],
                  ),
                )
            ),
            if (i != 3) Spacer(flex: 1),
          }]),
          Spacer(flex: 1),
          AdBannerWidget(),
        ]),
      ),
    );
  }
}

