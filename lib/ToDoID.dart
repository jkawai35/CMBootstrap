class ToDoID {
  String? id;
  String? todoText;
  bool isDone;

  ToDoID({
    required this.id,
    required this.todoText,
    this.isDone = false
  });

  static List<ToDoID> todoList() {
    return [];
  }
}

