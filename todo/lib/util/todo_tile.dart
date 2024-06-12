// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompletes;
  Function(bool?)? onChanged;
  Function(BuildContext) ? deleteFunction;
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompletes,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.red.shade300,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: taskCompletes, 
                onChanged: onChanged,
                activeColor: Colors.black)// to make black when we click the task
        ,            Text(taskName,
                    style: TextStyle(
                      decoration: taskCompletes ? TextDecoration.lineThrough 
                      : TextDecoration.none,//if the task is completed make line if not none
                    ),),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ), );
      
  }
}