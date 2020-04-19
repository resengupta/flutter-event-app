import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_2/events/events.dart';
import 'package:flutter_app_2/events/response.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Studio Events'),
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
  List<Events> _events = [];
  bool _isLoading = true;

  void _incrementCounter() {}

  void _fetchEvents() async {
    final response = await http
        .get('https://69chzojzla.execute-api.us-east-2.amazonaws.com/Prod/');
    String body = response.body;
    final Response dataContent = Response.fromJSON(jsonDecode(body));
    setState(() {
      _events.clear();
      _events.addAll(dataContent.dataContent.upcomingEvents);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Stack(children: <Widget>[_eventsListView(), _eventsProgressView()]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _eventsListView() {
    return ListView.builder(
      itemCount: this._events.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                trailing: Image(image: AssetImage('assets/engineering.png')),
                title: Text(this._events[index].name),
                subtitle: Text(this._events[index]?.desc ?? ""),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('INTERESTED'),
                    onPressed: () {
                      /* ... */
                    },
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _eventsProgressView() {
    return Visibility(
        visible: this._isLoading,
        child: Center(
          child: CircularProgressIndicator(),
        ));
  }
}
