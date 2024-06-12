// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_import, unused_field, annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  void initState() {
    //if this is the first time to create the app then create he default data
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    }else {
      //there already existes a data
      db.loadData();
    }
    super.initState();
  
    

  }
  final _controller = TextEditingController();
  //This line initializes a List called toDoList, which will store the to-do tasks.
//This line adds a new task to the toDoList. The task is represented as a list with two elements:
// the task name (a string) and the completion status (a boolean).

  
  //checkbox is tapped
 

//This method is called when the user taps the checkbox for a task.
//It takes two parameters: value (a nullable bool that represents the new state of the checkbox) and index (the index of the task in the toDoList).

  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  // Save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();//used to clear the task from the hint txt field after creating a new task so it leds to add new txt ot to the first hint txt field
    });
    Navigator.of(context).pop();
    db.updateDataBase();

  }
  //create a new task method
  void createNewTask() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        Oncancel: () => Navigator.of(context).pop(),

      );
    },

  );
} 
void deleteTask(int index) {
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDataBase();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(taskName: db.toDoList[index][0], taskCompletes: db.toDoList[index][1],
           onChanged: (value) => checkBoxChanged(value, index),
           deleteFunction: (context) => deleteTask(index),);
        }
      )
    );
  }
}