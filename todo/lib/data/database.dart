// ignore_for_file: unused_field

import 'package:hive/hive.dart';

class ToDoDataBase{

  List toDoList = [];
  // referencing the box
  final _mybox = Hive.box('mybox');

  // run this methof if it the he first time ever opening the app
  void createInitialData() {
    toDoList = [
      ['MakeTutorial', false],
      ['Do Eercise', false],
    ];


  }
  //load the data from the database
  void loadData() {
    toDoList = _mybox.get("TODOLIST");

  }
  // update the database

  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);

  }
}