import 'package:first_provider/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text('To Do List', style: AppText.heading),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.settings_rounded,
                size: 24,
              ))
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 12),
          itemCount: 1,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightIndigo,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This is title speaking',
                          style: AppText.subHeading,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'This is content speaking. read me through as I can only provide the details of the given title :)',
                          style: AppText.content,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
              child: Row(
                children: [
                  Icon(Icons.add_rounded),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Add Task',
                    style: AppText.smallContent,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
