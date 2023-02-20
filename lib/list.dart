import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:selector2/user.dart';

import 'dart:async';




class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {

  Map<String,String> headers = {
    'Content-Type':'application/json',
    'Accept': 'application/json'
  };




  Future<List<User>> fetchUser() async{
    var  data = await http.get(Uri.parse("http://192.168.100.8:1337/api/logins"),);

   // print(data.body);

    //final users = jsonData['data'];
      var jsonData= jsonDecode(data.body);

    // access the data list (id, name, email, password) in the parsed JSON
    var users=jsonData['data'];

    if (data.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON and add it to the list of users


      //(iterate over the list keyed by "data",
      // and decode each element with the User.fromJson constructor )

      return users.map<User>((userJson) => User.fromJson(userJson)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load User');
    }

  }


  late Future<List<User>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    fetchUser();
    return  Center(
      child: FutureBuilder<List<User>>(
        future: futureUser,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print (snapshot.data!);
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].email),
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