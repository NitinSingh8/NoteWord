import 'package:flutter/material.dart';

class WordBox extends StatefulWidget {
  final String word;
  final String meaning;
  final String Example;

  const WordBox({Key? key, required this.word, required this.meaning, this.Example="Not Given"}) : super(key: key);

  @override
  State<WordBox> createState() => _WordBoxState();
}

class _WordBoxState extends State<WordBox> {
  bool isVisible = true;
  IconData visibleIcon = Icons.visibility_off;

  void change(){
    if (isVisible==true){
      isVisible = false;
      visibleIcon = Icons.visibility;
    }else{
      isVisible = true;
      visibleIcon = Icons.visibility_off;
    }
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${widget.word}",style: TextStyle(fontSize: 24),),
              IconButton(onPressed: (){
                change();
              }, icon: Icon(visibleIcon))
            ],
          ),
          Visibility(
              visible: isVisible,
              child: Container(
                width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1)
                  ),
                  child: Text("Meaning: \n${widget.meaning} \nExample: \n${widget.Example}",textAlign: TextAlign.center,),))
        ],
      ),
    );
  }
}
