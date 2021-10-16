import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_fighter/models/winner_data.dart';
import 'package:git_fighter/widget/all_confetti_widget.dart';
import 'package:http/http.dart' as http;

class Winner extends StatefulWidget {
  String winner;

  Winner(String winner) {
    this.winner = winner;
  }

  @override
  _WinnerState createState() => _WinnerState(winner);
}

class _WinnerState extends State<Winner> {
  WinnerData winnerData = new WinnerData();

  String winner;

  _WinnerState(String winner) {
    this.winner = winner;
  }

  @override
  void initState() {
    super.initState();
    getProfileData();
    setState(() {});
  }

  void getProfileData() async {
    var response = await http.get(Uri.http('api.github.com', 'users/$winner'));
    var jsonData = await jsonDecode(response.body);
    setState(() {
      winnerData = WinnerData.fromJson(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(child: Text("Winner : $winner ")),
      ),
      body: Center(
        child: (SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AllConfettiWidget(),
                SizedBox(height: 20),
                Container(
                  height: 200.0,
                  width: 200.0,
                  child: winnerData.avatarUrl != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage("${winnerData.avatarUrl}"),
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                        )
                      : Container(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                ),
                Text(
                  "Followers : ${winnerData.followers}",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Following : ${winnerData.following}",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  width: 2000.0,
                  height: 6.0,
                  color: Colors.blueAccent,
                ),
                SizedBox(height: 20),
                Text(
                  "Repos : ${winnerData.publicRepos}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                winnerData.bio != null
                    ? Text(
                        "Bio : ${winnerData.bio}",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                winnerData.company != null
                    ? Text(
                        "Company : " "${winnerData.company}",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                winnerData.location != null
                    ? Text(
                        "Location : " "${winnerData.location}",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  width: 2000.0,
                  height: 6.0,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
