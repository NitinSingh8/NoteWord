import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override

  // Variable
  String todayWord = "Save at least one Word ";
  String todayMeaning = "Save at least one Word ";
  String todayExample = "Save at least one Word ";

  // Function

  void AddANewWord(context){
    Navigator.pushNamed(context, '/addNewWord');
    print("Went to add a new word");
  }

  void SeeWords(context){
    Navigator.pushNamed(context, '/seeWords');
    print("Went to add a new word");
  }


  final _words_box = Hive.box("wordBox");
  List getAllwords(){
    var data = [];
    try{
      int cnt = 0;
      while (true){
        var val = _words_box.get(cnt);
        if (val==null) return data;
        data.add(val);
        cnt+=1;
      }
    }catch(e){
      // print(data);
      return data;
    }
    return data;
  }


  Widget build(BuildContext context) {


    final double screenwidth = MediaQuery.of(context).size.width;


    List values = getAllwords();
    if (values.isNotEmpty){
      final random = new Random();
      var idx = random.nextInt(values.length);
      List today = values[idx];
      todayWord = today[0];
      todayMeaning = today[1];
      todayExample =  today[2];
      values.clear();
    }


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("NoteWord")),
        actions: [
          // IconButton(onPressed: (){}, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("Random Word in Collections",style: TextStyle(fontSize: 20),),

            ]
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  width: screenwidth-16,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    // color: Colors.brown,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Word       : ", style: TextStyle(fontSize:28,color: Colors.black),),
                          Container(
                              width: screenwidth-206,
                              child: Text("$todayWord", style: TextStyle(fontSize:24,color: Colors.purple),)
                          ,)
                        ],
                      ),
                      SizedBox(
                        height:5
                      ),
                      Row(

                        children: [
                          Text("Meaning : ", style: TextStyle(fontSize:28,color: Colors.black),),
                          Container(
                              width: screenwidth-206,
                              child: Text("$todayMeaning", style: TextStyle(fontSize:18,color: Colors.purple),))
                        ],
                      ),
                      SizedBox(
                          height:5
                      ),
                      Row(

                        children: [
                          Text("Example : ", style: TextStyle(fontSize:28,color: Colors.black),),
                          Container(
                              width: screenwidth-206,
                              child: Text("$todayExample", style: TextStyle(fontSize:18,color: Colors.purple),))
                        ],
                      )
                      // Text("Word :- $todayWord",style: TextStyle(fontSize: 26,color: Colors.white),),
                      // Text("Meaning :- Not set",style: TextStyle(fontSize: 26,color: Colors.white),),
                    ],
                  ),

                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                AddANewWord(context);
              },
                  child: Text("Add a New Word")
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(onPressed: (){
                SeeWords(context);
              },
                  child: Text("See All Words")
              )
            ],
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Developed by Nitin Singh"))
              ],
            ),
          )

        ],
      )
    );
  }
}
