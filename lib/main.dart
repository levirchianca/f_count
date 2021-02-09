import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _count = 0;
  String _msg = "Vago";

  void addPeople() {
    setState(() {
      if (_count < 20) {
        _count += 1;

        if (_count == 20) {
          _msg = "Lotado";
        } else {
          _msg = "Vago";
        }
      }
    });
  }

  void decrePeople() {
    setState(() {
      if (_count > 0) {
        _count -= 1;

        if (_count < 20) {
          _msg = "Vago";
        } else {
          _msg = "Lotado";
        }
      }
    });
  }

  void _resetPerson() {
    setState(() {
      _count = 0;
      _msg = "Vago";
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador de Pessoas"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetPerson,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: Text(_msg,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40)),
            )),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    height: 40,
                    onPressed: addPeople,
                    child: Center(
                      child: Icon(
                        Icons.remove_sharp,
                        size: 20,
                      ),
                    ),
                    color: Colors.amberAccent,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      "$_count",
                      style: TextStyle(color: Colors.black87, fontSize: 36),
                    ),
                  ),
                  FlatButton(
                    height: 40,
                    onPressed: addPeople,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                    color: Colors.amberAccent,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
