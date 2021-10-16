import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_fighter/screens/winner_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Git Fighter'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.grey[800],
              child: Center(
                child: Column(
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/90468365?s=400&u=b7c419ea83147ff256e2902208183cd7401c2aa2&v=4'),
                              fit: BoxFit.fill),
                        )),
                    Text(
                      'Pavan Bhadane',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Text(
                      'pavan49719@gmail.com',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.grey[700],
              child: Center(
                  child: Text(
                'Follwers: 48',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.grey[700],
              child: Center(
                  child: Text(
                'Follwing: 21',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.grey[700],
              child: Center(
                  child: Text(
                'Repos : 11',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            )
          ],
        ),
      ),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    const Text(
                      'Git Fighter',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 90),
                    TextField(
                      controller: txtUser1Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User 1',
                          hintText: 'Enter username'),
                    ),
                    SizedBox(height: 60),
                    InkWell(
                      onTap: () {
                        startFight();
                      },
                      borderRadius: BorderRadius.circular(20),
                      //  hoverColor: Colors.indigoAccent[200],
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.indigoAccent,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/fight.png',
                                width: 120,
                                height: 120,
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: 60),
                    TextField(
                      controller: txtUser2Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User 2',
                          hintText: 'Enter username'),
                    ),
                    SizedBox(height: 90),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 2000.0,
                      height: 6.0,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 2000.0,
                      height: 6.0,
                      color: Colors.greenAccent,
                    )
                  ],
                ),
              ))),
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
      responseUser1 = await http
          .get(Uri.http('api.github.com', 'users/${txtUser1Controller.text}'));
      responseUser2 = await http
          .get(Uri.http('api.github.com', 'users/${txtUser2Controller.text}'));
      var jsonData1 = jsonDecode(responseUser1.body);
      var jsonData2 = jsonDecode(responseUser2.body);
      if (jsonData1["message"] == "Not Found" ||
          jsonData2["message"] == "Not Found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Enter valid username"),
        ));
      } else {
        int user1Followers = jsonData1['followers'];
        int user2Followers = jsonData2['followers'];
        int user1Following = jsonData1['following'];
        int user2Following = jsonData2['following'];
        setState(
          () {
            if ((user1Followers + user1Following) >
                (user2Followers + user2Following))
              winner = txtUser1Controller.text;
            else
              winner = txtUser2Controller.text;
            print("winner is $winner");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Winner(winner),
              ),
            );
          },
        );
      }
    }
  }
}
