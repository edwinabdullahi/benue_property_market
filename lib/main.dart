import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jsonlist/about.dart';
import 'package:jsonlist/services/calls_and_messages_service.dart';
import 'package:jsonlist/services/service_locator.dart';
import 'detail_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Benue Property Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Benue Property Market'),
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
  Future<List<User>> _getUsers() async {
    var data = await http.get("http://www.json-generator.com/api/json/get/bTHBZGidYO?indent=2");
    var jsonData = json.decode(data.body);
    List<User> users = [];
    for (var u in jsonData) {
      User user =
          User(u["index"], u["descrption"], u["location"], u["price"], u["picture"], u["agent_phone1"], u["agent_phone2"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String number = "08020933407";
  final String number1 = "07032498926";
  final String email = "benuepropertymarket@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:
           Icon(Icons.menu),



          title:
               Text('Benue Property Market',
    style: TextStyle(

    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 21
    ),),


          actions: <Widget>[
            GestureDetector(
              child:  Icon(Icons.more_vert),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            AboutPage()));
              },
              ),

          ]
        ),



      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(

                    leading: Padding(
                   
                      child: Image.network(snapshot.data[index].picture),
                padding: EdgeInsets.all(8.0),
                      ),
                 

                    title: Text(snapshot.data[index].location,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),),

                    subtitle:  Text(snapshot.data[index].price,
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
class User {
  final int index;
  final String descrption;
  final String location;
  final String price;
  final String picture;
  final String agent_phone1;
  final String agent_phone2;
  User(this.index, this.descrption, this.location, this.price, this.picture, this.agent_phone1, this.agent_phone2);
}
