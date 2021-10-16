import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:git_fighter/screens/winner_screen.dart';
import 'package:http/http.dart' as http;

class FightScreen extends StatefulWidget {
  @override
  _FightScreenState createState() => _FightScreenState();
}

class _FightScreenState extends State<FightScreen> {
  final TextEditingController txtUser1Controller = TextEditingController();

  final TextEditingController txtUser2Controller = TextEditingController();

  String winner;
  var responseUser1, responseUser2;

  // createAlertDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Please Enter Something'),
  //           actions: [
  //             MaterialButton(
  //               elevation: 5.0,
  //               child: Text('Re-enter'),
  //               onPressed: () {
  //                 return;
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Git Fighter"),
      ),
      body: Container(
        color: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: txtUser1Controller,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "First User",
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  hintText: "Enter GitHub username",
                  hintStyle: TextStyle(fontSize: 13.0),
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    startFight();
                  },
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    // color: Colors.white,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/fight.png'),
                          fit: BoxFit.fill),
                      color: Colors.white,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: txtUser2Controller,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Second User",
                  hintText: "Enter GitHub username",
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  hintStyle: TextStyle(fontSize: 13.0),
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startFight() async {
    if (txtUser1Controller.text == "" ||
        txtUser2Controller.text == "" ||
        txtUser1Controller.text == null ||
        txtUser2Controller.text == null) {
      // createAlertDialog(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter username"),
      ));
    } else {
      //   responseUser1 = await http
      //       .get("https://api.github.com/users/${txtUser1Controller.text}");
      //   responseUser2 = await http
      //       .get("https://api.github.com/users/${txtUser2Controller.text}");
      //   var jsonData1 = jsonDecode(responseUser1.body);
      //   var jsonData2 = jsonDecode(responseUser2.body);
      //   int user1Followers = jsonData1['followers'];
      //   int user2Followers = jsonData2['followers'];
      //   int user1Following = jsonData1['following'];
      //   int user2Following = jsonData2['following'];
      //   setState(
      //     () {
      //       if ((user1Followers + user1Following) >
      //           (user2Followers + user2Following))
      //         winner = txtUser1Controller.text;
      //       else
      //         winner = txtUser2Controller.text;
      //       print("winner is $winner");

      //       // Navigator.push(
      //       //   context,
      //       //   MaterialPageRoute(
      //       //     builder: (BuildContext context) => Winner(winner),
      //       // ),
      //       // );
      //     },
      //   );
      // }
    }
  }
}
