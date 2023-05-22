class ToDo {
  String? id;
  String? todoText;
  bool isDone = false;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: '1',
        todoText: 'Interview with Google',
        isDone: true,
      ),
      ToDo(
        id: '2',
        todoText: 'Interview with Apple',
        isDone: true,
      ),
      ToDo(
        id: '3',
        todoText: 'Interview with Facebook',
        isDone: false,
      ),
      ToDo(
        id: '4',
        todoText: 'Interview with Amazon',
        isDone: false,
      ),
    ];
  }
}
