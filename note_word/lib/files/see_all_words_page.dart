import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_word/files/word_box_page.dart';

class AllWords extends StatelessWidget {
  AllWords({Key? key}) : super(key: key);

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
      return data;
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {

    List values = getAllwords();

    print(values);

    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Words"),
      ),
      body: ListView.builder(
          itemCount: values.length,
          itemBuilder: (context,index){
        return WordBox(word: values[index][0], meaning: values[index][1], Example: values[index][2]);
      }),



    );
  }
}
