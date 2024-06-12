// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback Oncancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.Oncancel,
    required this.onSave,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add Your Task",
          ),
          ),
          //buttons to save and cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            MyButton(text: "Save", onPressed: onSave),
            const SizedBox(width: 0,),
            MyButton(text: "Cancel", onPressed: Oncancel),
          ],)


        ],)
        
        
      ),
    );
  }
}