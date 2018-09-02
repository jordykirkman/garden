import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(title: 'Garden'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application.
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _potWaterLevel = 0;

  void _addWater({String potName}) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _potWaterLevel++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            PotWidget(),
            PotWidget(),
            PotWidget(),
          ],
        ),
      ),
      
      floatingActionButton: new FloatingActionButton(
        onPressed: _addWater,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class PotWidget extends StatefulWidget {
  @override
  _PotWidgetState createState() => _PotWidgetState();
}

class _PotWidgetState extends State<PotWidget> {
  int _waterLevel = 0;

  void _addWater() {
    setState(() {
        _waterLevel += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: Icon(Icons.star),
            color: Colors.red[500],
            onPressed: _addWater,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_waterLevel'),
          ),
        ),
      ],
    );
  }
}