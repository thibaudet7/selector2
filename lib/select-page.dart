
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:selector2/mytext-view.dart';
import 'dart:convert';

import 'package:selector2/user.dart';


class SelectTextPage extends StatefulWidget {
  const SelectTextPage({Key? key}) : super(key: key);

  @override
  State<SelectTextPage> createState() => _SelectTextPageState();
}

class _SelectTextPageState extends State<SelectTextPage> {



  TextSelector textSelector=TextSelector(id: 0, text: '');

  Map<String,String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };


  Future saveText() async{

    if (textSelector.id==0) {
      await http.post(Uri.parse("http://192.168.100.8:1337/api/selectors/"),headers:headers,
        body:jsonEncode(

            {
              'data': {
                "text": textSelector.text,
              }
            }

        ),);
    }
    else{
      await http.put(Uri.parse("http://192.168.100.8:1337/api/selectors/${textSelector.id.toString()}"),
        headers:headers,
        body:jsonEncode(
            {
              'data': {
                "text": textSelector.text,
              }
            }

        ),);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200 ,
              decoration: BoxDecoration(
        border: Border.all(width: 5,
            color: Colors.deepPurpleAccent),
    ),
              child: Theme(
                data: ThemeData(
                    textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Colors.yellow,
                      selectionColor: Colors.green,
                      selectionHandleColor: Colors.blue,
                    )
                ),
                child: const SelectableText(
                  'this is a text',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            const SizedBox(height: 20,),
             TextField(
                 onChanged: (val){
                   textSelector.text=val;
                 },
              controller:  TextEditingController(text:textSelector.text),
              minLines: 3,
              maxLines: 15,
              decoration: const InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10,),
            MaterialButton(
              onPressed:(){
                saveText();
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const MyTextView(),),);

              },
              minWidth: double.infinity,
              color: Colors.blue,
              textColor: Colors.blue,
              child: const Text("save",
                style: TextStyle(
                    color: Colors.white, fontSize: 25),),
            ),
          ],
        ),
      ),
    );
  }

}
