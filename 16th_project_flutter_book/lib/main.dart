import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'appointments/Appointments.dart';
import 'contacts/Contacts.dart';
import 'notes/Notes.dart';
import 'tasks/Tasks.dart';
import 'utils.dart' as utils;

void main() {
  startMeUp() async {
    Directory docsDir = await getApplicationDocumentsDirectory();
    //getApplicationDocumentsDirectory()는 지속적인 storage를 제공하는 Directory객체를 반환한다.
    //이때 이코드가 완료되기전 다른 코드가 실행되면 안되기에 await을 사용한다.
    utils.docsDir = docsDir;
    runApp(FlutterBook());
  }

  startMeUp();
}

class FlutterBook extends StatelessWidget {
  const FlutterBook({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar:AppBar(
            title: Text('Flutter Book'),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.date_range)
              ,text: "Appointments"
              ),
              Tab(icon: Icon(Icons.contacts)
              ,text: "Contacts"
              ),
              Tab(icon: Icon(Icons.note)
              ,text: "Notes"
              ),
              Tab(icon: Icon(Icons.assignment_turned_in)
              ,text: "Tasks"
              )
            ],),
          ) ,
          body: TabBarView(children: [Appointments(),Contacts(),Notes(),Tasks()],),
          ),
          
      ),
    );
  }
}