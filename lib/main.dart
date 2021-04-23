import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Icon',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'My Icon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, bool> values = {
    'Allow Change Icon Size?': false,
    'Allow Change Icon Color?': false,
  };
  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
    // Clear array after use.
    tmpArray.clear();
  }

  //Declare Variables
  var alarmIcon, changeIc = true, changeCL = false;
  var allcolor;
  double red = 0, green = 0, blue = 0;
  double opcaityIC = 1.0, opacityCl = 1.0;

  void _opacityIc(bool vlv) {
    if (vlv == true) {
      setState(() {
        opcaityIC = 1.0;
      });
    } else {
      setState(() {
        opcaityIC = 0.0;
      });
    }
  }

  void _opacityCl(bool vlv) {
    if (vlv == false) {
      setState(() {
        opacityCl = 0.0;
      });
    } else {
      setState(() {
        opacityCl = 1.0;
      });
    }
  }

  //Set State for Icon Size
  void _addSize() {
    if (changeIc == true) {
      setState(() {
        alarmIcon = alarmIcon + 50.0;
      });
    } else {}
  }

  void _minusSize() {
    if (changeIc == true) {
      setState(() {
        if (alarmIcon < 0) {
          alarmIcon = 0.0;
        } else {
          alarmIcon = alarmIcon - 50.0;
        }
      });
    } else {}
  }

  void _large() {
    if (changeIc == true) {
      setState(() {
        alarmIcon = 350.0;
      });
    } else {}
  }

  void _medium() {
    if (changeIc) {
      setState(() {
        alarmIcon = 250.0;
      });
    } else {}
  }

  void _small() {
    if (changeIc) {
      setState(() {
        alarmIcon = 100.0;
      });
    } else {}
  }

  //Set Icon Color
  void _colorRed() {
    if (changeCL) {
      setState(() {
        allcolor = Color.fromRGBO(255, 0, 0, 1);
        red = 255;
        green = 0;
        blue = 0;
      });
    } else {}
  }

  void _colorGreen() {
    if (changeCL) {
      setState(() {
        allcolor = Color.fromRGBO(0, 255, 0, 1);
        green = 255;
        red = 0;
        blue = 0;
      });
    } else {}
  }

  void _colorBlue() {
    if (changeCL) {
      setState(() {
        allcolor = Color.fromRGBO(0, 0, 255, 1);
        blue = 255;
        green = 0;
        red = 0;
      });
    } else {}
  }

  void _changeRGB() {
    setState(() {
      allcolor = Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          Opacity(
            opacity: opcaityIC,
            child: IconButton(
                icon: Icon(Icons.zoom_out_outlined), onPressed: _minusSize),
          ),
          Opacity(
            opacity: opcaityIC,
            child: IconButton(
                icon: Icon(Mdi.alphaSCircleOutline), onPressed: _small),
          ),
          Opacity(
            opacity: opcaityIC,
            child: IconButton(
                icon: Icon(Mdi.alphaMCircleOutline), onPressed: _medium),
          ),
          Opacity(
            opacity: opcaityIC,
            child: IconButton(
                icon: Icon(Mdi.alphaLCircleOutline), onPressed: _large),
          ),
          Opacity(
            opacity: opcaityIC,
            child: IconButton(
                icon: Icon(Icons.zoom_in_outlined), onPressed: _addSize),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.alarm,
                size: alarmIcon,
                color: allcolor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Slider(
                      min: 0,
                      max: 255,
                      value: red,
                      onChanged: (double values) {
                        setState(() {
                          red = values;
                          _changeRGB();
                        });
                      }),
                  Slider(
                      min: 0,
                      max: 255,
                      value: green,
                      onChanged: (double values) {
                        setState(() {
                          green = values;
                          _changeRGB();
                        });
                      }),
                  Slider(
                      min: 0,
                      max: 255,
                      value: blue,
                      onChanged: (double values) {
                        setState(() {
                          blue = values;
                          _changeRGB();
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  Visibility(
                    visible: !changeCL,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Color(0x00000000),
                              elevation: 0,
                              child: Text(red.toStringAsFixed(0),
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Color(0x00000000),
                              elevation: 0,
                              child: Text(green.toStringAsFixed(0),
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Color(0x00000000),
                              elevation: 0,
                              child: Text(blue.toStringAsFixed(0),
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: changeCL,
                    child: FloatingActionButton(
                      onPressed: _colorRed,
                      backgroundColor: Color.fromRGBO(255, 0, 0, 1),
                      child: Text(red.toStringAsFixed(0)),
                    ),
                  ),
                  Visibility(
                    visible: changeCL,
                    child: FloatingActionButton(
                      onPressed: _colorGreen,
                      backgroundColor: Color.fromRGBO(0, 255, 0, 1),
                      child: Text(green.toStringAsFixed(0)),
                    ),
                  ),
                  Visibility(
                    visible: changeCL,
                    child: FloatingActionButton(
                      onPressed: _colorBlue,
                      backgroundColor: Color.fromRGBO(0, 0, 255, 1),
                      child: Text(blue.toStringAsFixed(0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            children: values.keys.map((String key) {
              return new CheckboxListTile(
                  title: new Text(key),
                  value: values[key],
                  onChanged: (bool value) {
                    setState(() {
                      values[key] = value;
                      if (values["Allow Change Icon Size?"] == value) {
                        changeIc = value;
                        _opacityIc(value);
                      }
                      if (values["Allow Change Icon Color?"] == value) {
                        changeCL = value;
                        _opacityCl(value);
                      }
                    });
                  });
            }).toList(),
          )),
        ],
      ),
    );
  }
}
