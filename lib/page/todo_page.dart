import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // editor control to get access to what user typed
  String myGretting = "";
  TextEditingController myController = TextEditingController();
  void getUser() {
    setState(() {
      myGretting = "Hello, ${myController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(myGretting),
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Type your name..."),
              ),
              ElevatedButton(
                  onPressed: getUser,
                  child: const Text(
                    "Tap!",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
