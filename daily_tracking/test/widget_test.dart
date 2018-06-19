import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:core';

import 'widget_test_utils.dart';

import 'package:daily_tracking/main.dart';


class FakeDataStore implements DataStore {
  
  FakeDataStore();

  var store = '';
  @override
  put(IconData icon) {
      // TODO: implement put
      store += TestUtils.getIconName(icon);
    }

  contains(String str){
    return store.contains(str);
  }
}

void main() {

  testWidgets('Has button with sentiment_very_satisfied icon', (WidgetTester tester) async  {
    //Arrange    
    var dataStore = new FakeDataStore();
    //var clickLogger = new ClickLogger(dataStore);
    //Act
    //No act because starting the app is the act itself. 
    await tester.pumpWidget(buildTestableWidget(new SmileyPage(dataStore)));
    
    //Assert
   expect(find.widgetWithIcon(FlatButton, Icons.sentiment_very_satisfied), findsOneWidget);  
  });

  
  testWidgets('hit smiley face button should resutl in call to save icon name in dataStore', (WidgetTester tester) async {
    //Arrange    
    var dataStore = new FakeDataStore();
    //var clickLogger = new ClickLogger(dataStore);
    //Act
    //No act because starting the app is the act itself. 
    await tester.pumpWidget(buildTestableWidget(new SmileyPage(dataStore)));

    await tester.tap(find.byIcon(Icons.sentiment_very_satisfied));
    await tester.pump();

    var searchTerm = Icons.sentiment_very_satisfied;
  
    var result = dataStore.store.contains(TestUtils.getIconName(Icons.sentiment_very_satisfied));

    expect(true, result);  
  });
}

