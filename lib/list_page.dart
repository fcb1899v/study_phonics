import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'extension.dart';
import 'constant.dart';
import 'main_page.dart';

class ListPage extends HookConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      Scaffold(
        ///AppBar
        appBar: AppBar(
          backgroundColor: pinkColor,
          shadowColor: Colors.transparent,
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
          color: pinkColor,
          padding: EdgeInsets.all(listTopMargin),
          child: GridView.count(
            crossAxisCount: context.listRowNumber(),
            crossAxisSpacing: listMargin,
            mainAxisSpacing: listMargin,
            children: List.generate(numberPhonics, (i) => Container(
              padding: const EdgeInsets.all(listPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: blueColor),
              child:GridTile(
                child: TextButton(
                  child: Text(allPhonics[i],
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: listCharSize,
                      shadows: [myShadow()],
                    ),
                  ),
                  onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage(index: i))
                  ),
                ),
              )
            ),
          ),
        ),
      ),
    );
}

