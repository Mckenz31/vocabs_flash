import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height / 2.7,
            width: double.infinity,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
              color: Color(0xffF5591F),
              gradient: LinearGradient(
                  colors: [(new Color(0xffF5591F)), (new Color(0xffF2861E))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    "FLACABULARY",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width/10,
                        fontFamily: "Times New Roman",
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF5591F),
                      border: Border.all(
                        color: Color(0xffF5591F),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                    child: Text(
                      "Flashcards",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/vocabSets');
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      color: Color(0xffF5591F),
                      border: Border.all(
                        color: Color(0xffF5591F),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                    child: Text(
                      "Vocabulary list",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        if(Hive.box('vocabSets').length == 0){
                          showDialog<void>(
                            context: context,
                            // barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(child: const Text('Sets not created')),
                                content: SingleChildScrollView(
                                  child: Center(child: Text('Go to FlashCards and create a vocabulary set')),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Okay',),
                                    style: TextButton.styleFrom(
                                      primary: Colors.deepOrange,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        else{
                          Navigator.pushNamed(context, '/practiceCards');
                        }
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      color: Color(0xffF5591F),
                      border: Border.all(
                        color: Color(0xffF5591F),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                    child: Text(
                      "Browse words",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/search');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ); //
  }
}
