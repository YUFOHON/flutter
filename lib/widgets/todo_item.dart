import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/constants/colors.dart';
import '../model/todo.dart';

// ignore: camel_case_types
class todo_item extends StatelessWidget {
  final ToDo todo;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  todo_item(
      {Key? key,
      required this.todo,
      required this.onDelete,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          tileColor: Colors.white,
          leading: Icon(
              todo.isDone ? Icons.check_circle_outline : Icons.circle_outlined,
              color: tdBlue),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              color: tdBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            child: IconButton(
              onPressed: onDelete,
              color: Colors.purple,
              icon: const Icon(Icons.delete),
            ),
          ),
          onTap: onTap),
    );
  }
}
