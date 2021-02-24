import 'package:flutter/material.dart';
import 'package:simple_grpc/models/hello.dart';
import 'package:simple_grpc/pb/hello.pb.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Person personinfo = Person();
  List<int> idlist = [1, 2, 3];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: unnecessary_statements
    _loadDetails(idlist.first);
  }

  _loadDetails(int id) async {
    final person = await Hello().getInfo(id);
    setState(() {
      personinfo = person;
    });
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
          title: Text("Simple grpc"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 100, right: 100 , top:50),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            children: <Widget>[
              Text("ID : "),
              DropdownButtonFormField(
                  value: idlist.first,
                  onChanged: (id) {
                    _loadDetails(id);
                  },
                  items: idlist
                      .map((e) =>
                          DropdownMenuItem(child: Text(e.toString()), value: e))
                      .toList()),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Id : " + personinfo.id.toString()),
                      SizedBox(height: 20),
                      Text("Name : " + personinfo.name),
                      SizedBox(height: 20),
                      Text("Age : " + personinfo.age.toString())
                    ],
                  )
                ],
              ),
              Spacer()
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
