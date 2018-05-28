// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:daily_tracking/main.dart';

void main() {
  //testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(new MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  testWidgets('Has button with sentiment_very_satisfied icon', (WidgetTester tester) async  {
    //Arrange    
    //Act
    //No act because starting the app is the act itself. 
    await tester.pumpWidget(new TrackerApp());
    
    //Assert
    expect(find.widgetWithIcon(FlatButton, Icons.sentiment_very_satisfied), findsOneWidget);  
  });

  //clicking button hits db
  //db class -> abstract track
    //track smileys
  
  testWidgets('hit face calls save on database with icon name', (WidgetTester tester) async {
    //Arrange    
    var dataStore = new FakeDataStore();
    var clickLogger = new ClickLogger(dataStore: dataStore);
    //Act
    //No act because starting the app is the act itself. 
    await tester.pumpWidget(new TrackerApp());

    await tester.tap(find.byIcon(Icons.sentiment_very_satisfied));
    await tester.pump();

    var searchTerm = Icons.sentiment_very_satisfied.toString();
    print('--------------------------------------------------------------------' + searchTerm);
    print('dataStore.store: ' + dataStore.store);
    var result = dataStore.store.contains(Icons.sentiment_very_satisfied.toString());


    expect(true, result);  

  });

  test('Click smiley triggers save', () {
    //repeat above test without UI 
    //test datastore.put()
  });
 
  test("SmileyPage exists", () {
    var smileyPage = new SmileyPage();
    var smileyPageState = smileyPage.createState(); 

    //expect(true, smileyPageState is smileyPage.createState())
    var result = false;//smileyPageState is SmileyPageState;
    expect(true, result);
  });

}

class FakeDataStore implements DataStore {
  
  FakeDataStore(){

  }
  var store = '';
  @override
  put(Icon icon) {
      // TODO: implement put
      store += icon.toString();
    }

  contains(String str){
    return store.contains(str);
  }
}