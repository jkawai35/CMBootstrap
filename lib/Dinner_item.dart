import 'package:bootstrap_cm/ToDoID.dart';
import 'package:flutter/material.dart';
import 'DinnerID.dart';

class DinnerItem extends StatelessWidget {
  final DinnerID dinner;
  final onToDoChanged;
  final onDeleteItem;

  const DinnerItem({required this.dinner, required this.onToDoChanged, this.onDeleteItem, super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(dinner);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          dinner.isCooked ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          dinner.dinnerText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: dinner.isCooked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(dinner.Dinnerid);
            },
          ),
        ),
      ),
    );
  }
}

