import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Date And Time Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dateTime;
  TimeOfDay _timeOfDay;

  getDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year),
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 2));

    setState(() {
      _dateTime = date;
    });
  }

  getTime() async {
    TimeOfDay time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      _timeOfDay = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _dateTime == null
                  ? Text("Choose date")
                  : Text(
                      "Date:  ${_dateTime.year}, ${_dateTime.month}, ${_dateTime.day} ",
                      style: TextStyle(fontSize: 35),
                    ),
              _timeOfDay == null
                  ? Text("Choose time")
                  : Text(
                      "Time:  ${_timeOfDay.hour}-${_timeOfDay.minute}",
                      style: TextStyle(fontSize: 35),
                    ),
              RaisedButton(
                onPressed: () {
                  getDate();
                },
              ),
              RaisedButton(
                onPressed: () {
                  getTime();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
