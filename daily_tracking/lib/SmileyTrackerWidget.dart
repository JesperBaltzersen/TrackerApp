import 'package:flutter/material.dart';

class SmileyTracker extends StatefulWidget {

  Function _onTrackingOptionSelected;
    
  SmileyTracker({onTrackingOptionSelected : Function}){
    _onTrackingOptionSelected = onTrackingOptionSelected; 
  }

  @override
  _SmileyTrackerState createState() => new _SmileyTrackerState(_onTrackingOptionSelected);

}

class _SmileyTrackerState extends State<SmileyTracker>{
  IconData _chosenIcon;
  List<IconData> _icons = [
    Icons.sentiment_very_satisfied,
    Icons.sentiment_satisfied,
    Icons.sentiment_dissatisfied,
    Icons.sentiment_very_dissatisfied,
  ]; 
  Function _onTrackingOptionSelected;

  _SmileyTrackerState(this._onTrackingOptionSelected);

  _onPressed(IconData icon){
    setState(() {
          _chosenIcon = icon;
          _onTrackingOptionSelected(icon);
        });
  }

  @override
  Widget build(BuildContext context){
    return new ListView(
          children: <Widget>[
            new FlatButton(
              onPressed: () => _onPressed(_icons[0]),
              child: new Icon(_icons[0]),
            ),
            new FlatButton(
              onPressed: () => _onPressed(_icons[1]),
              child: new Icon(_icons[1]),
            ),
            new FlatButton(
              onPressed: () => _onPressed(_icons[2]),
              child: new Icon(_icons[2]),
            ),
            new FlatButton(
              onPressed: () => _onPressed(_icons[3]),
              child: new Icon(_icons[3]),
            ),
            new Center(
              child: new Text( (_chosenIcon != null) ? _chosenIcon.codePoint.toString() : "na"),
              ),
          ],
        ); 
  }
}