import 'package:flutter/material.dart';
import 'main.dart';
import 'services/calls_and_messages_service.dart';
import 'services/service_locator.dart';
import 'about.dart';
class DetailsPage extends StatelessWidget {
  final User user;
  DetailsPage(this.user);
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String number = "08027914691";
  final String number1 = "07032498926";
  final String email = "ofuella007@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[600],
      appBar: AppBar(
          backgroundColor: Colors.transparent,
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
          child: Center(
              child: Column(
                  children: <Widget>[
                    Padding(
                      child: Text('Property Details',
                      style: TextStyle(

                        color: Colors.white70,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,

                      ),),
                      padding: EdgeInsets.all(20.0),


                    ),
                    Card(



                      child: Image.network('${user.picture}'),


                    ),

                    Padding(
                      child: Text(
                        'Description: ${user.descrption}',
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                    Padding(
                      child: Text(
                        'Location: ${user.location}',
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                    Padding(
                      child: Text(
                        'Price: ${user.price}',

                      ),
                      padding: EdgeInsets.all(20.0),
                    ),

                    SizedBox(height: 20),
                    RaisedButton(
                      child: Text(
                        "Agent's Contact: $number",
                      ),
                      onPressed: () => _service.call(number),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      child: Text(
                        "Agent's Contact: $number1",
                      ),
                      onPressed: () => _service.call(number1),
                    ),
                  ]
              )
          ),
        ));
  }
}