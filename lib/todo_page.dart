import 'package:bootstrap_cm/Dinner.dart';
import 'package:flutter/material.dart';
import 'todo_item.dart';
import 'ToDoID.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key, required this.title});

  final String title;

  @override
  State<ToDo> createState() => ToDoState();

}

class ToDoState extends State<ToDo> {
  final todosList = ToDoID.todoList();
  List<ToDoID> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState(){
    _foundToDo = todosList;
    super.initState();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                    child: ListView(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              top: 50,
                              bottom: 20,
                            ),
                            child: Text("Groceries Needed",style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500
                            ),
                            ),
                        ),
                        for (ToDoID todoo in _foundToDo.reversed)
                        ToDoItem(
                            todo: todoo,
                            onToDoChanged: _HandleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                        ),

                      ],
                    )
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(margin: EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0,0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                ),],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: "Add new groceries",
                  border: InputBorder.none,

                ),
              )
              ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, bottom: 20),
                child: ElevatedButton(
                  child: Text("+",style: TextStyle(fontSize: 40),),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              )
            ],)
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 620),
        child: FloatingActionButton(
          onPressed: _moveToDinner,
          tooltip: 'Next',
          child: const Icon(Icons.arrow_right),
        )
      ),
    );
  }

  void _HandleToDoChange(ToDoID todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDoID(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword){
    List<ToDoID> results = [];
    if (enteredKeyword.isEmpty){
      results = todosList;
    } else {
      results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  void _moveToDinner() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dinner(title: "Dinner List")),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey,
            )
        ),
      ),

    );
  }
}
