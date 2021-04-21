import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import "dashboard2.dart";

Future<void> main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(new MainScreen());
  });
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JoyPad(),
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
    );
  }
}

class JoyPad extends StatefulWidget {
  final String title;
  JoyPad({Key key, this.title}) : super(key: key);
  @override
  _JoyPadState createState() => _JoyPadState();
}

class _JoyPadState extends State<JoyPad> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });

      if (_currentUser != null) {
        _handleFirebase();
      }
    });

    _googleSignIn.signInSilently();
  }

  void _handleFirebase() async {
    GoogleSignInAuthentication googleAuth = await _currentUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final FirebaseUser firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      print('Giriş Başarılı!');

      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new dashboard2()));
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

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
            // ),
          ),

          //Round Text
          /*
          new Container(
            padding: const EdgeInsets.all(30.0),
            child: new Text("Fatih Sultan Mehmet",
                style: TextStyle(color: Colors.blue, fontSize: 32.0)),
          ),
*/
          //Timer Text

          new Container(
              padding: new EdgeInsets.only(bottom: 42.0, top: 10.0),
              child: ElevatedButton(
                //color: Colors.green,
                //highlightColor: Colors.red,
                //elevation: 10,
                child: Text(
                  "Google Giriş",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _handleSignIn();
                },
              )
              /* new RaisedButton(
              color: Colors.green,
              highlightColor: Colors.red,
              elevation: 10,
              child: Text(
                "Google Giriş",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _handleSignIn();
              },
            ), */
              ),

/*
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Previous Button
              new RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: CircleBorder(),
                child: Icon(
                  Icons.arrow_left,
                  size: 48.0,
                ),
                onPressed: () {
                  print("left");
                  setState(() {});
                },
              ),

              //Start/Pause Button
              new RaisedButton(
                onPressed: () {
                  print("right");
                },
                color: Colors.blue,
                textColor: Colors.white,
                shape: CircleBorder(),
                child: Icon(
                  Icons.arrow_right,
                  size: 48.0,
                ),
              ),

              //Restart Button
              new RaisedButton(
                onPressed: () {
                  print("up");
                },
                color: Colors.green,
                textColor: Colors.white,
                shape: CircleBorder(),
                child: Icon(
                  Icons.arrow_upward,
                  size: 48.0,
                ),
              ),

              //Next Button
              new RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.arrow_downward,
                    size: 48.0,
                  ),
                  onPressed: () {
                    print("down");
                  })
                  
            ],
          ), */
        ],
      ),
    );
  }
}
