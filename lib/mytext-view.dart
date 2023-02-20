import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:selector2/user.dart';

import 'dart:async';




class MyTextView extends StatefulWidget {
  const MyTextView({Key? key}) : super(key: key);

  @override
  State<MyTextView> createState() => _MyTextViewState();
}

class _MyTextViewState extends State<MyTextView> {




  Future<List<TextSelector>> fetchText() async{
    var  data = await http.get(Uri.parse("http://192.168.100.8:1337/api/selectors"),);

     print(data.body);

    //final users = jsonData['data'];
    var jsonData= jsonDecode(data.body);

    // access the data list (id, name, email, password) in the parsed JSON
    var texts=jsonData['data'];

    if (data.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON and add it to the list of users


      //(iterate over the list keyed by "data",
      // and decode each element with the User.fromJson constructor )

      return texts.map<TextSelector>((userJson) => TextSelector.fromJson(userJson)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Text');
    }

  }


  late Future<List<TextSelector>> futureText;

  @override
  void initState() {
    super.initState();
    futureText = fetchText() ;
  }

  @override
  Widget build(BuildContext context) {
    //fetchText();
    return  Scaffold(
      appBar:  AppBar(title: const Text("text view"),),
      body: Center(
        child: FutureBuilder<List<TextSelector>>(
            future: futureText,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        title: Text(snapshot.data![index].text),
                        onTap: (){},
                      );
                    }

                );

                //Text(snapshot.data!.name);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}





// ListView.builder(
// itemCount: snapshot.data.length,
// itemBuilder: (BuildContext context, int index){
// return ListTile(
// title: Text(snapshot.data![index].name),
// subtitle: Text(snapshot.data![index].email),
// onTap: (){},
// );
// }
//
// );