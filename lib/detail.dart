//
// import 'package:flutter/material.dart';
// import 'package:selector2/user.dart';
//
// class MyDetail extends StatefulWidget {
//    MyDetail({Key? key, required this.user}) : super(key: key);
//
//   User user;
//
//   @override
//   State<MyDetail> createState() => _MyDetailState();
// }
//
// class _MyDetailState extends State<MyDetail> {
//
//   void edit(){
//
//   }
//   void delete(){
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title:  Text(widget.user.name),),
//         body: Padding(
//           padding: const EdgeInsets.all(19.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Id: ${widget.user.id}",
//                 style: const TextStyle(fontSize: 20),),
//               Text("Name: ${widget.user.name}",
//                 style: const TextStyle(fontSize: 20),),
//               Text("Email: ${widget.user.email}",
//                 style: const TextStyle(fontSize: 20),),
//               Row(
//                 children: [
//                   MaterialButton(onPressed: edit,
//                   color: Colors.blue,
//                   textColor:Colors.white,
//                   child:const Text("Edit") ,
//                   ),
//                   const Spacer(),
//                   MaterialButton(onPressed:delete,
//                     color: Colors.blue,
//                     textColor:Colors.white,
//                     child:const Text("Delete") ,
//                   ),
//
//                 ],
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
