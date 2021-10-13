import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'models/todo.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String? selectedDate;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  Todo? createTodo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Title'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Content'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    minTime: DateTime(2021, 10, 13),
                    showTitleActions: true,
                    onChanged: (date) {
                      setState(() {
                        this.selectedDate =
                            DateFormat("dd-MM-yyyy").format(date).toString();
                      });
                    },
                  );
                },
                child: Column(
                  children: [
                    Text(
                      this.selectedDate.toString(),
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text('Select Due Date'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  this.createTodo = Todo(4, titleController.text,
                      descriptionController.text, this.selectedDate.toString());
                  Navigator.pop(context, this.createTodo);
                },
                child: Text('Create Todo List'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
