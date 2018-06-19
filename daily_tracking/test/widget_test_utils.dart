import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

 
class TestUtils {
  
  static Map<IconData,String> iconDataStrings;
  
  TestUtils(){
    _setIconDataMap();
  } 

  void _setIconDataMap(){
    iconDataStrings = new Map<IconData, String>()
      ..addEntries([
        MapEntry<IconData,String>(Icons.sentiment_very_satisfied, 'sentiment_very_satisfied'),
        MapEntry<IconData,String>(Icons.sentiment_satisfied, 'sentiment_satisfied'),
        MapEntry<IconData,String>(Icons.sentiment_dissatisfied, 'sentiment_dissatisfied'),
        MapEntry<IconData,String>(Icons.sentiment_very_dissatisfied, 'sentiment_very_dissatisfied'),
        ]);
  }
  static String getIconName(IconData icon) {
    if(iconDataStrings == null){
      TestUtils();
    }
    if (iconDataStrings.containsKey(icon)){
      return iconDataStrings[icon]; 
    }
    throw new NoSuchIconException('No Icon found for key: ${icon}');
  }

}

class NoSuchIconException implements Exception {
  String cause;
  NoSuchIconException(this.cause);
}

//test extension
Widget buildTestableWidget(Widget widget) {
  // https://docs.flutter.io/flutter/widgets/MediaQuery-class.html
  return new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(home: widget)
  );
}