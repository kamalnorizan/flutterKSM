import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item'),
      ),
      body: Center(
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
            ElevatedButton(
              onPressed: () {},
              child: Text('Create Todo List'),
            ),
          ],
        ),
      )),
    );
  }
}
