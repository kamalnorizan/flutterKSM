import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String? selectedDate;

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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Title'),
              ),
              SizedBox(height: 10),
              TextField(
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
                        this.selectedDate = date.toString();
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
                onPressed: () {},
                child: Text('Create Todo List'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
