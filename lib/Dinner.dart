import 'package:flutter/material.dart';
import 'Dinner_item.dart';
import 'DinnerID.dart';
import 'Stats.dart';
class Dinner extends StatefulWidget {
  const Dinner({super.key, required this.title});

  final String title;

  @override
  State<Dinner> createState() => DinnerState();
}

class DinnerState extends State<Dinner> {
  final dinnersList = DinnerID.dinnerList();
  List<DinnerID> _foundDinner = [];
  final _dinnerController = TextEditingController();

  @override
  void initState(){
    _foundDinner = dinnersList;
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
                          child: Text("Meals Planned",style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                        for (DinnerID dinner in _foundDinner.reversed)
                          DinnerItem(
                            dinner: dinner,
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
                      controller: _dinnerController,
                      decoration: InputDecoration(
                        hintText: "Add a new meal",
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
                      _addToDoItem(_dinnerController.text);
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
            onPressed: _moveToStats,
            tooltip: 'Next',
            child: const Icon(Icons.arrow_right),
          )
      ),
    );
  }

  void _HandleToDoChange(DinnerID dinner){
    setState(() {
      dinner.isCooked = !dinner.isCooked;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      dinnersList.removeWhere((item) => item.Dinnerid == id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      dinnersList.add(DinnerID(Dinnerid: DateTime.now().millisecondsSinceEpoch.toString(), dinnerText: toDo));
    });
    _dinnerController.clear();
  }

  void _runFilter(String enteredKeyword){
    List<DinnerID> results = [];
    if (enteredKeyword.isEmpty){
      results = dinnersList;
    } else {
      results = dinnersList.where((item) => item.dinnerText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundDinner = results;
    });
  }

  void _moveToStats() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Stats(title: "Stats")),
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
