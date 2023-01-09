import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_word/data/words_data.dart';


class AddNewWordPage extends StatelessWidget {
  AddNewWordPage({Key? key}) : super(key: key);

  // Variable
  final  _formkey  = GlobalKey<FormState>();
  final newWord = TextEditingController();
  final newWordMeaning = TextEditingController();
  final newExample = TextEditingController();

  // Function
  void SaveWords(context){
    if (_formkey.currentState!=null && _formkey.currentState!.validate()){
      final _words_box = Hive.box("wordBox");
      // final int last_idx = _words_box.length;
      // final obj = Words(word: newWord.text, meaning: newWordMeaning.text, WordsKey: last_idx, Example: newExample.text);
      if (newExample.text==""){
        newExample.text = "Not Set";
      }
      _words_box.add([newWord.text, newWordMeaning.text, newExample.text]);
      // print(_words_box.getAt(2));
      Navigator.pushReplacementNamed(context, '/seeWords');
      // print(_words_box.getAt(0).word);
    }else{
      print("error in adding word ");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Word"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if (value!=null && value.isEmpty){
                    return "Word is mandatory for save";
                  }
                  return null;
                },
               controller: newWord,
                decoration: InputDecoration(
                  hintText: "Word",

                ),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                minLines: 1,
                validator: (value){
                  if (value!=null && value.isEmpty){
                    return "Meaning is mandatory for save";
                  }
                  return null;
                },
                controller: newWordMeaning,
                decoration: InputDecoration(
                  hintText: "Meaning",
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                minLines: 1,
                controller: newExample,
                decoration: InputDecoration(
                  hintText: "Example(Optional)",
                ),
              ),
              ElevatedButton(onPressed: (){SaveWords(context);},  child: Text("Save",style: TextStyle(fontSize: 34),))
            ],
          ),
        ),
      ),

    );
  }
}
