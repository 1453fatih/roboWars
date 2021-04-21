import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class dashboard2 extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();
  bool forward = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Robo Wars"),
      ),
      body: new Column(
        children: <Widget>[
          //Mute Button

          new Container(
            alignment: Alignment.topRight,
            padding: new EdgeInsets.only(top: 20.0),
            // child: new FlatButton(
            //  onPressed: () {},
            //),
          ),

          //Round Text
          new Container(
            padding: const EdgeInsets.all(30.0),
            child: new Text("Mobiler.dev - Fatih Yiğit",
                style: TextStyle(color: Colors.blue, fontSize: 32.0)),
          ),

          //Timer Text

          new Container(
            alignment: Alignment.bottomCenter,
            padding: new EdgeInsets.only(bottom: 30.0, top: 5.0),
            // child: new Text(("Reklam Alanı :)")),
          ),

          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                child: GestureDetector(
                  child: new Icon(
                    Icons.arrow_left_sharp,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    _left();
                  },
                  onLongPressUp: () {
                    _stoprl();
                  },
                ),
                onPressed: () {},
              ),

              ElevatedButton(
                child: GestureDetector(
                  child: new Icon(
                    Icons.arrow_right_sharp,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    _right();
                  },
                  onLongPressUp: () {
                    _stoprl();
                  },
                ),
                onPressed: () {},
              ),

              ElevatedButton(
                child: GestureDetector(
                  child: new Icon(
                    Icons.arrow_upward,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    _forward();
                  },
                  onLongPressUp: () {
                    _stopfb();
                  },
                ),
                onPressed: () {},
              ),

              ElevatedButton(
                child: GestureDetector(
                  child: new Icon(
                    Icons.arrow_downward,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    _back();
                  },
                  onLongPressUp: () {
                    _stopfb();
                  },
                ),
                onPressed: () {},
              ),
/*
              new RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: CircleBorder(),
                child: GestureDetector(
                  child: new Icon(
                    Icons.arrow_left,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    _left();
                  },
                  onLongPressUp: () {
                    _stoprl();
                  },
                ),
                onPressed: () {},
                onLongPress: () {
                  print("left");
                },
              ),
*/
              //Start/Pause Button
/*
              new RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: CircleBorder(),
                child: GestureDetector(
                  child: new Icon(
                    Icons.arrow_right,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    _right();
                  },
                  onLongPressUp: () {
                    _stoprl();
                  },
                ),
                onPressed: () {},
              ),  */

              //Restart Button
/*
              new RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                shape: CircleBorder(),
                child: GestureDetector(
                  child: new Icon(
                    Icons.arrow_upward,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    _forward();
                  },
                  onLongPressUp: () {
                    _stopfb();
                  },
                ),
                onPressed: () {},
              ),
*/
              //Next Button
/*
              new RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                shape: CircleBorder(),
                child: GestureDetector(
                  child: new Icon(
                    Icons.arrow_downward,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                    _back();
                  },
                  onLongPressUp: () {
                    _stopfb();
                  },
                ),
                onPressed: () {},
              ) */
            ],
          ),
        ],
      ),
    );
  }

  void _forward() {
    databaseReference.child("robowars_Fatih/move").set({'forward': 'ileri'});
  }

  void _back() {
    databaseReference.child("robowars_Fatih/move").set({'back': 'back'});
  }

  void _right() {
    databaseReference.child("robowars_Fatih/turn").set({'right': 'right'});
  }

  void _left() {
    databaseReference.child("robowars_Fatih/turn").set({'left': 'left'});
  }

/*
  void getData() {
    databaseReference
        .child('robowars_Fatih')
        .once()
        .then((DataSnapshot snapshot) {
      print('robowars_Fatih: ${snapshot.value}');
    });
  }
*/
  void _stopfb() {
    databaseReference
        .child('robowars_Fatih/move')
        .update({'forward': 'stop', 'back': 'stop'});
  }

  void _stoprl() {
    databaseReference
        .child('robowars_Fatih/turn')
        .update({'right': 'stop', 'left': 'stop'});
  }

/*
  void deleteData() {
    databaseReference.child('robowars_Fatih').remove();
  }   */
}
