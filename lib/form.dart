
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:selector2/main.dart';
import 'package:selector2/user.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  User user=User(id: 0, name: '', email: '', password: '');

  Map<String,String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };


  Future save() async{

    if (user.id==0) {
      await http.post(Uri.parse("http://192.168.100.8:1337/api/logins/"),headers:headers,
        body:jsonEncode(

            {
              'data': {
                "name": user.name,
                "email": user.email,
                "password": user.password
              }
            }

        ),);
    }
  else{
      await http.put(Uri.parse("http://192.168.100.8:1337/api/logins/${user.id.toString()}"),
        headers:headers,
        body:jsonEncode(
            {
              'data': {
                "name": user.name,
                "email": user.email,
                "password": user.password
              }
            }

        ),);
    }

  }

  @override
  Widget build(BuildContext context) {

    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          children:   [
            Visibility(
              visible: false,
              child: TextField(
                controller: TextEditingController(text:user.id.toString()),
                onChanged: (val){
                  user.id=int.parse(val);
                },
              ),
            ),
           TextField(
             controller: TextEditingController(text:user.name),
             onChanged: (val){
               user.name=val;
             },
             decoration:const InputDecoration(
               label: Text("Name"),
               icon: Icon(Icons.person)

             ) ,
           ),
            TextField(
              controller: TextEditingController(text:user.email),
              onChanged: (val){
                user.email=val;
              },
              decoration:const InputDecoration(
                  label: Text("Email"),
                  icon: Icon(Icons.email_outlined)
              ) ,
            ),
            TextField(
              controller: TextEditingController(text:user.password),
              onChanged: (val){
                user.password=val;
              },
              decoration:const InputDecoration(
                  label: Text("Password"),
                  icon: Icon(Icons.vpn_key_outlined)
              ) ,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35,20, 0, 20),
              child: MaterialButton(
                  onPressed:(){ save();
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const Home(1),),);},


                minWidth: double.infinity,
                color: Colors.blue,
                textColor: Colors.blue,
                child: const Text("save",
                  style: TextStyle(
                      color: Colors.white, fontSize: 25),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
