import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
  final _myBox = Hive.box("mybox");

  // run this method if this the first time ever opening this app
  void createInitialData() {
    todoList = [
      ["Make Tutorial", false],
      ["Do count exercise", false]
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}
