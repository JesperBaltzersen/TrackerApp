import 'package:flutter/material.dart';
import 'SmileyTrackerWidget.dart';

void main() => runApp(new TrackerApp(new DataStore()));

class TrackerApp extends StatelessWidget {
  final DataStore dataStore;

  TrackerApp(DataStore dataStore) : dataStore = dataStore {}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Put in mood goddammit!!!',
      theme: new ThemeData(),
      home: new SmileyPage(dataStore),
    );
  }
}

class SmileyPage extends StatefulWidget {
  final DataStore dataStore;

  SmileyPage(DataStore dataStore) : dataStore = dataStore;

  @override
  _SmileyPageState createState() => new _SmileyPageState(dataStore);
}

class _SmileyPageState extends State<SmileyPage> {
  DataStore _dataStore;
  ClickLogger _clickLogger;




  _SmileyPageState(DataStore dataStore) {
        _dataStore = dataStore;
        _clickLogger = new ClickLogger(_dataStore);
  }

  @override
    void initState() {
      // TODO: implement initState
      _dataStore = _dataStore; //this commits the field to state
      _clickLogger = _clickLogger;

      super.initState();
    }

  _onPressed(IconData icon){
    setState(() {
          _clickLogger.logSmileyClick(icon);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Track me'),
      ),
      body: new Center(
        child: new SmileyTracker(onTrackingOptionSelected: _onPressed),
      ),
    );
  }
}



class ClickLogger {
  DataStore _dataStore;

  ClickLogger(DataStore dataStore) {
    _dataStore = dataStore;
  }

  void logSmileyClick(IconData icon) {
    _dataStore.put(icon);
  }
}

class DataStore {
  String store = 'fake';
  IconData _icon;
  DataStore() {
    //save to firebase
  }

  put(IconData icon) {
    _icon = icon;
    _putInFirebase();
  }

  _putInFirebase() {
  print('put icon in firebase');
  }
}

