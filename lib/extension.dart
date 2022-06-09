import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

extension StringExt on String {

  void debugPrint() {
    if (kDebugMode) print(this);
  }

  //this is sound[num]
  Future<void> speakText(BuildContext context) async {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage('en-Us');
    //flutterTts.setSpeechRate(0.5);
    await flutterTts.stop();
    await flutterTts.speak(this);
  }

  //this is char
  List<String> phonicsWord() {
    switch (this) { //:6
      case "a": return ["", "a", "pple", "", "a", "nt"];              //[ア]と[エ]の中間
      case "a'": return ["", "a", "corn", "", "a", "ngelfish"];       //[エイ]
      case "b": return ["", "b", "anana", "", "b", "ee"];             //[ブッ]
      case "c": return ["", "c", "innamon roll", "", "c", "icada"];   //[ス]:1
      case "c'": return ["", "c", "orn", "", "c", "at"];              //[クッ]
      case "d": return ["", "d", "onut", "", "d", "og"];              //[ドッ]
      case "e": return ["", "e", "gg", "", "e", "lephant"];           //[エ]
      case "f": return ["", "f", "lower", "", "f", "rog"];            //[フ]
      case "g": return ["", "g", "inger", "", "g", "iraffe"];         //[ジュッ]
      case "g'": return ["", "g", "rapes", "", "g", "orilla"];        //[グッ]
      case "h": return ["", "h", "amburger", "", "h", "orse"];        //[ハ]
      case "i": return ["", "i", "ndoor shoes", "", "i", "njector"];  //[アイ]
      case "i'": return ["", "i", "ce cream", "", "i", "sland"];      //[イ]と[エ]の中間:1
      case "j": return ["", "j", "uice", "", "j", "ellyfish"];        //[ジュッ]
      case "k": return ["", "k", "iwi", "", "k", "oala"];             //[クッ]
      case "l": return ["", "l", "emon", "", "l", "ion"];             //[ウッ]
      case "m": return ["", "m", "ango", "", "m", "antis"];           //[ム]
      case "n": return ["", "n", "ut", "", "n", "eedle"];             //[ン]
      case "o": return ["", "o", "range", "", "o", "strich"];         //[ア]と[オ]の中間
      case "p": return ["", "p", "ineapple", "", "p", "ig"];          //[プッ]
      case "q": return ["", "q", "uestion", "", "q", "uilt"];         //[クワッ]:2
      case "r": return ["", "r", "abbit", "", "r", "ainbow"];         //[ウルッ]
      case "s": return ["", "s", "weet potato", "", "s", "quirrel"];  //[ス]
      case "s'": return ["televi", "s", "ion", "chee", "s", "e"];     //[ズ]
      case "t": return ["", "t", "omato", "", "t", "iger"];           //[トッ]
      case "u": return ["", "u", "mbrella", "", "u", "p"];            //[ア] //1
      case "v": return ["", "v", "egetables", "", "v", "est"];        //[ヴ]
      case "w": return ["", "w", "atermelon", "", "w", "itch"];       //[ウッ]
      case "x": return ["", "x", "ylophone", "fo", "x", ""];          //[クス]
      case "y": return ["", "y", "ogurt", "", "y", "acht"];           //[ィヤ] //1
      case "z": return ["", "z", "ebra", "", "z", "ero"];         //[ズ] //1
    //[アー]
      case "er": return ["hamst","er","", "cucumb","er",""];
      case "ir": return ["g","ir","l", "t-sh","ir","t"];
      case "or": return ["elevat","or","", "escalat","or",""];
      case "ur": return ["t","ur","tle", "b","ur","dock"];
      case "ear'": return ["","ear","th", "h","ear","t"];
    //[アィ]
      case "ie": return ["meat p","ie","", "neck t","ie",""];
      case "igh": return ["traffic l","igh","t", "e","igh","t"];
      case "-y": return ["cherr","y","", "butterfl","y",""];
      case "_i_e": return ["", "fire"," engine", "","nine",""];
    //[アゥ]
      case "ou": return ["m","ou","se", "h","ou","se"];
      case "ow": return ["c","ow","", "t","ow","er"];
    //[イー]
      case "ēē": return ["b","ee","tle", "coff","ee",""];
      case "ēā": return ["p","ea","ch", "","ea","gle"];
      case "īē": return ["cook","ie","", "zomb","ie",""];
      case "ey": return ["hon","ey","", "monk","ey",""];
      case "_e_e": return ["centi","pede","", "conc","rete",""]; //1
    //[イァ]
      case "eer": return ["d","eer","", "b","eer",""];
      case "ear": return ["","ear","", "g","ear",""]; //1
    //[ウー]
      case "ue": return ["bl","ue","berry", "tiss","ue",""];
      case "ui": return ["passion fr","ui","t", "s","ui","t"]; //
      case "ew": return ["st","ew","", "n","ew","spaper"]; //1
      case "ōō": return ["bad t","oo","th", "kangar","oo",""];
      case "ōū": return ["s","ou","p", "r","ou","ge"];
      case "_u_e": return ["per","fume","", "sugar ","cube",""]; //2
    //[ウッ]
      case "oo": return ["g","oo","d", "b","oo","kstore"];
    //[エィ]:1
      case "ai": return ["tr","ai","n", "sn","ai","l"];
      case "ay": return ["ok","ay","", "manta r","ay",""]; //1
      case "_a_e": return ["","cake","", "s","nake",""];
    //[エァ]
      case "air": return ["","air","plane", "h","air","dryer"];
    //[エ]:1
      case "ea": return ["br","ea","d", "f","ea","ther"];
    //[オー]:4
      case "au": return ["Santa Cl","au","s", "s","au","sage"];
      case "aw": return ["str","aw","berry", "see s","aw",""];
      case "our": return ["c","our","t", "f","our",""]; //1
    //[オィ]
      case "oy": return ["b","oy","", "s","oy","beans"];
    //[オゥ]:2
      case "oa": return ["g","oa","t", "t","oa","st"];
      case "ōw": return ["sn","ow","man", "","ow","l"];
      case "_o_e": return ["","rose","", "tad","pole",""];
    //[オーゥ]:2
      case "all": return ["b","all","", "m","all",""];
    //[フ]:
      case "ph": return ["dol","ph","in", "smart","ph","one"];
    //[チュッ]:
      case "ch": return ["","ch","ocolate", "","ch","icken"];
    //[シュ]:
      case "sh": return ["mu","sh","room", "","sh","ark"];
    //[ス]:
      case "th": return ["","th","under", "","th","ree"];
    //[ズ]:
      case "th'": return ["mo","th","er", "rhy","th","m"];
    //[ハウッ]
      case "wh": return ["","wh","ale", "ferris ","wh","eel"];
    //[クッ]
      case "ck": return ["du","ck","", "clo","ck",""];
    //[ングゥ]
      case "ng": return ["puddi","ng","", "fryi","ng"," pan"];
    //[リィ]:4
      case "lly": return ["je","lly","", "be","lly",""]; //2
      default: return ["","","", "","",""];
    }
  }

  //this is char
  List<String> phonicsPicture() {
    switch (this) {
      case "a": return ["assets/image/apple.png", "assets/image/ant.png"];
      case "a'": return ["assets/image/acorn.png", "assets/image/angelfish.png"];
      case "b": return ["assets/image/banana.png", "assets/image/bee.png"];
      case "c": return ["assets/image/cinnamonroll.png", "assets/image/cicada.png"];
      case "c'": return ["assets/image/corn.png", "assets/image/cat.png"];
      case "d": return ["assets/image/donut.png", "assets/image/dog.png"];
      case "e": return ["assets/image/egg.png", "assets/image/elephant.png"];
      case "f": return ["assets/image/flower.png", "assets/image/frog.png"];
      case "g": return ["assets/image/ginger.png", "assets/image/giraffe.png"];
      case "g'": return ["assets/image/grapes.png", "assets/image/gorilla.png"];
      case "h": return ["assets/image/hamburger.png", "assets/image/horse.png"];
      case "i": return ["assets/image/indoorshoes.png", "assets/image/injector.png"];
      case "i'": return ["assets/image/icecream.png", "assets/image/island.png"];
      case "j": return ["assets/image/juice.png", "assets/image/jellyfish.png"];
      case "k": return ["assets/image/kiwi.png", "assets/image/koala.png"];
      case "l": return ["assets/image/lemon.png", "assets/image/lion.png"];
      case "m": return ["assets/image/mango.png", "assets/image/mantis.png"];
      case "n": return ["assets/image/nut.png", "assets/image/needle.png"];
      case "o": return ["assets/image/orange.png", "assets/image/ostrich.png"];
      case "p": return ["assets/image/pineapple.png", "assets/image/pig.png"];
      case "q": return ["assets/image/question.png", "assets/image/quilt.png"];
      case "r": return ["assets/image/rabbit.png", "assets/image/rainbow.png"];
      case "s": return ["assets/image/sweetpotato.png", "assets/image/squirrel.png"];
      case "s'": return ["assets/image/television.png", "assets/image/cheese.png"];
      case "t": return ["assets/image/tomato.png", "assets/image/tiger.png"];
      case "u": return ["assets/image/umbrella.png", "assets/image/up.png"];
      case "v": return ["assets/image/vegetables.png", "assets/image/vest.png"];
      case "w": return ["assets/image/watermelon.png", "assets/image/witch.png"];
      case "x": return ["assets/image/xylophone.png", "assets/image/fox.png"];
      case "y": return ["assets/image/yogurt.png", "assets/image/yacht.png"];
      case "z": return ["assets/image/zebra.png", "assets/image/zero.png"];
    //[アー]
      case "er": return ["assets/image/hamster.png", "assets/image/cucumber.png"];
      case "ir": return ["assets/image/girl.png", "assets/image/t-shirt.png"];
      case "or": return ["assets/image/elevator.png", "assets/image/escalator.png"];
      case "ur": return ["assets/image/turtle.png", "assets/image/burdock.png"];
      case "ear'": return ["assets/image/earth.png", "assets/image/heart.png"];
    //[アィ]:3
      case "ie": return ["assets/image/meatpie.png", "assets/image/necktie.png"]; //2
      case "igh": return ["assets/image/trafficlight.png", "assets/image/eight.png"];
      case "-y": return ["assets/image/cherry.png", "assets/image/butterfly.png"];
      case "_i_e": return ["assets/image/fireengine.png", "assets/image/nine.png"]; //1
    //[アゥ]
      case "ou": return ["assets/image/mouse.png", "assets/image/house.png"];
      case "ow": return ["assets/image/cow.png", "assets/image/tower.png"];
    //[イー]:2
      case "ēē": return ["assets/image/beetle.png", "assets/image/coffee.png"];
      case "ēā": return ["assets/image/peach.png", "assets/image/eagle.png"];
      case "īē": return ["assets/image/cookie.png", "assets/image/zombie.png"]; //2
      case "ey": return ["assets/image/honey.png", "assets/image/monkey.png"];
      case "_e_e": return ["assets/image/centipede.png", "assets/image/concrete.png"];
    //[イァ]:4
      case "eer": return ["assets/image/deer.png", "assets/image/beer.png"]; //1
      case "ear": return ["assets/image/ear.png", "assets/image/gear.png"]; //1
    //[ウー]:2
      case "ue": return ["assets/image/blueberry.png", "assets/image/tissue.png"];
      case "ui": return ["assets/image/passionfruit.png", "assets/image/suit.png"]; //
      case "ew": return ["assets/image/stew.png", "assets/image/newspaper.png"]; //1
      case "ōō": return ["assets/image/badtooth.png", "assets/image/kangaroo.png"];
      case "ōū": return ["assets/image/soup.png", "assets/image/rouge.png"];
      case "_u_e": return ["assets/image/perfume.png", "assets/image/sugarcube.png"];
    //[ウッ]
      case "oo": return ["assets/image/good.png", "assets/image/bookstore.png"];
    //[エィ]:1
      case "ai": return ["assets/image/train.png", "assets/image/snail.png"];
      case "ay": return ["assets/image/okay.png", "assets/image/mantaray.png"]; //1
      case "_a_e": return ["assets/image/cake.png", "assets/image/snake.png"];
    //[エァ]
      case "air": return ["assets/image/airplane.png", "assets/image/hairdryer.png"];
    //[エ]:1
      case "ea": return ["assets/image/bread.png", "assets/image/feather.png"];
    //[オー]:4
      case "au": return ["assets/image/santaclaus.png", "assets/image/sausage.png"]; //1
      case "aw": return ["assets/image/strawberry.png", "assets/image/seesaw.png"]; //1
      case "our": return ["assets/image/court.png", "assets/image/four.png"]; //1
    //[オィ]
      case "oy": return ["assets/image/boy.png", "assets/image/soybeans.png"];
    //[オゥ]:2
      case "oa": return ["assets/image/goat.png", "assets/image/toast.png"];
      case "ōw": return ["assets/image/snowman.png", "assets/image/owl.png"];
      case "_o_e": return ["assets/image/rose.png", "assets/image/tadpole.png"];
    //[オーゥ]:2
      case "all": return ["assets/image/ball.png", "assets/image/mall.png"]; //1
    //[フ]:
      case "ph": return ["assets/image/dolphin.png", "assets/image/smartphone.png"];
    //[チュッ]:
      case "ch": return ["assets/image/chocolate.png", "assets/image/chicken.png"];
    //[シュ]:
      case "sh": return ["assets/image/mushroom.png", "assets/image/shark.png"];
    //[ス]:
      case "th": return ["assets/image/thunder.png", "assets/image/three.png"];
    //[ズ]:
      case "th'": return ["assets/image/mother.png", "assets/image/rhythm.png"];
    //[ハウッ]
      case "wh": return ["assets/image/whale.png", "assets/image/ferriswheel.png"];
    //[クッ]
      case "ck": return ["assets/image/duck.png", "assets/image/clock.png"];
    //[ングゥ]
      case "ng": return ["assets/image/pudding.png", "assets/image/fryingpan.png"];
    //[リィ]:4
      case "lly": return ["assets/image/jelly.png", "assets/image/belly.png"]; //2
      default: return ["", ""];
    }
  }
}

extension ListStringExt on List<String> {

  List<String> wordSound() => [
    "${this[0]}${this[1]}${this[2]}",
    "${this[3]}${this[4]}${this[5]}"
  ];
}

extension DoubleExt on double {

  int listRowNumber() => this ~/ 100 + 1;
  double picWidth() => (this < 620) ? this / 2 - 60: 250;
  double picHeight() => (this < 620) ? this / 2 - 60: 250;
}