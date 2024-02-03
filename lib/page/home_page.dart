import 'package:fl_todo_app/data/database.dart';
import 'package:fl_todo_app/util/dialog_box.dart';
import 'package:fl_todo_app/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // referencing the box
  final _myBox = Hive.box('mybox');

  final _controller = TextEditingController();

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // if this is the time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            'TO DO',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskName: db.todoList[index][0],
                taskCompleted: db.todoList[index][1],
                deleteFunction: (context) => deleteTask(index),
                onChanged: (value) => checkBoxChanged(value, index));
          },
        ));
  }
}
