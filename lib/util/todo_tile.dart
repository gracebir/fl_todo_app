import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ));
  }
}
