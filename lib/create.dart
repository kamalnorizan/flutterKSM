import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_project/services/api.dart';

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
  var btnTitle = 'Create Todo List';
  var todo_id;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteSettings settings = ModalRoute.of(context)!.settings;

    if (settings.arguments != null) {
      this.createTodo = settings.arguments as Todo;
      this.todo_id = this.createTodo!.id.toString();
      this.titleController.text = this.createTodo!.title.toString();
      this.descriptionController.text = this.createTodo!.content.toString();
      this.selectedDate = DateFormat('dd-MM-yyyy')
          .format(DateFormat('yyyy-MM-dd').parse(this.createTodo!.dueDate))
          .toString();
      this.btnTitle = 'Update Todo Item';
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Item'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter value here";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Content',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter value here";
                    } else {
                      return null;
                    }
                  },
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
                    print(this.selectedDate != null);

                    if (formKey.currentState!.validate() &&
                        this.selectedDate != null) {
                      var due = DateFormat('yyyy-MM-dd').format(
                          DateFormat('dd-MM-yyyy')
                              .parse(this.selectedDate.toString()));
                      if (this.createTodo != null) {
                        _updateTodo();
                      } else {
                        _storeTodo();
                      }
                      this.createTodo = Todo(
                          id: 4,
                          title: titleController.text,
                          content: descriptionController.text,
                          dueDate: due.toString());
                      Navigator.pop(context, this.createTodo);
                    } else {
                      _showDialog(context);
                    }
                  },
                  child: Text(btnTitle),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  _storeTodo() async {
    var data = {
      'title': this.titleController.text,
      'content': this.descriptionController.text,
      'due_date': DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd-MM-yyyy').parse(this.selectedDate.toString()))
          .toString()
    };

    await CallApi().postData(data, 'todolist/store');
  }

  _updateTodo() async {
    var data = {
      'id': this.todo_id,
      'title': this.titleController.text,
      'content': this.descriptionController.text,
      'due_date': DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd-MM-yyyy').parse(this.selectedDate.toString()))
          .toString()
    };

    await CallApi()
        .postData(data, 'todolist/update/' + this.createTodo!.id.toString());
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text('Error'),
              content: Text('Sila penuhkan tempat kosong'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'),
                )
              ],
            ),
          );
        });
  }
}
