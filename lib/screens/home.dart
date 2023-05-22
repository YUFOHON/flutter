import 'package:flutter/material.dart';
import 'package:myapp/constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ToDo> todosList = ToDo.todoList();
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final TextEditingController _createTextEditingController =
      TextEditingController();
  String _searchQuery = '';

  void _deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((todo) => todo.id == id);
    });
  }

  void _toggleTodoItem(String id) {
    setState(() {
      final todo = todosList.firstWhere((todo) => todo.id == id);
      todo.isDone = !todo.isDone;
    });
  }

  List<ToDo> get _filteredTodosList {
    if (_searchQuery.isEmpty) {
      return todosList;
    } else {
      return todosList
          .where((todo) =>
              todo.todoText!.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: _searchTextEditingController,
              decoration: InputDecoration(
                hintText: 'Search tasks',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredTodosList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: todo_item(
                      onTap: () =>
                          _toggleTodoItem(_filteredTodosList[index].id!),
                      todo: _filteredTodosList[index],
                      onDelete: () =>
                          _deleteTodoItem(_filteredTodosList[index].id!),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _createTextEditingController,
                    decoration: InputDecoration(
                      hintText: 'Add a new task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final newTodo = ToDo(
                      id: (todosList.length + 1).toString(),
                      todoText: _createTextEditingController.text,
                      isDone: false,
                    );
                    setState(() {
                      todosList.add(newTodo);
                    });
                    _createTextEditingController.clear();
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Widget searchBox(_textEditingController) {
//   return Container(
//     child: Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(50),
//               topRight: Radius.circular(50),
//               bottomLeft: Radius.circular(50),
//               bottomRight: Radius.circular(50),
//             ),
//           ),
//           child: TextField(
//             controller: _textEditingController,
//             decoration: InputDecoration(
//               hintText: 'Search',
//               hintStyle: TextStyle(color: tdGrey),
//               prefixIcon: Icon(Icons.search, color: tdGrey),
//               border: InputBorder.none,
//             ),
//             onChanged: (value) {
//               this._searchQuery = value;);
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: tdBGColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, color: tdBlack, size: 30),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/images/avatar.jpg', fit: BoxFit.cover),
          ),
        ),
      ],
    ),
  );
}
