import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/ajay.jpeg'),
                ),
                Text('Ajay Chinta',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Pacifico',
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Source Sans Pro',
                      color: Colors.teal[100],
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: 20, width: 150, child: Divider(color: Colors.teal)),
                Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                          leading: Icon(Icons.phone, color: Colors.teal),
                          title: Text('+91 98765 98765',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source Sans Pro'))),
                    )),
                Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                            leading: Icon(Icons.email, color: Colors.teal),
                            title: Text(
                              'abc@xyz.com',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.teal.shade900,
                                  fontFamily: 'Source Sans Pro'),
                            ))))
              ],
            ))));
  }
}
