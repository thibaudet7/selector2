import 'package:flutter/material.dart';
import 'package:selector2/form.dart';
import 'package:selector2/list.dart';
import 'package:selector2/select-page.dart';


void main() => runApp( const Home(0));

class Home extends StatefulWidget {
   const Home(this.state, {super.key});

   final int state;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    changeView(widget.state);
    super.initState();
  }

  late int _currentIndex;
   late Widget _body;
   late String _title;

  void _onTapped (int index){
    changeView(index);

  }

  void changeView (index) {
  _currentIndex=index;
    setState(() {
      switch(index){
        case 0: {
          _title="Form";
          _body=const MyForm();
          break;
        }
        case 1: {
          _title="List";
          _body=const MyList();
          break;
        }
        case 2: {
          _title="Select test";
          _body=const SelectTextPage();
          break;
        }
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(_title),),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              label: 'view1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_outlined),
              label: 'select',
            ),

          ],

          selectedItemColor: Colors.blueAccent,
          currentIndex: _currentIndex,
          onTap: _onTapped,

        ),
      ),
    );
  }
}
