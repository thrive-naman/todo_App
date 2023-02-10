import 'package:first_provider/formValidator.dart';
import 'package:first_provider/main.dart';
import 'package:first_provider/todoModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

TextEditingController titleText = TextEditingController();
TextEditingController descText = TextEditingController();

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    final toDoModel = Provider.of<ToDoModel>(buildContext);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text('To Do List', style: AppText.heading),
        actions: [
          Padding(
              padding: EdgeInsets.only(
                right: 16,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(buildContext, '/settings');
                },
                child: Icon(
                  Icons.settings_rounded,
                  size: 24,
                ),
              ))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(buildContext).size.height,
        child: toDoModel.taskList.isEmpty
            ? Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Voila!!! No task Found',
                      style: AppText.subHeading,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Create a new task to get started',
                      style: AppText.content,
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.only(top: 12),
                itemCount: toDoModel.taskList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                                toDoModel.taskList[index].title,
                                style: AppText.subHeading,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              toDoModel.taskList[index].descrption == ''
                                  ? SizedBox(
                                      height: 0,
                                    )
                                  : Text(
                                      toDoModel.taskList[index].descrption,
                                      style: AppText.content,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              context: buildContext,
              builder: (sheetContext) {
                final validation = Provider.of<FieldValidator>(sheetContext);
                final toDoModel = Provider.of<ToDoModel>(sheetContext);

                return Padding(
                  // padding: const EdgeInsets.symmetric(
                  //     horizontal: 12.0, vertical: 20)
                  // ,
                  padding: MediaQuery.of(sheetContext).viewInsets,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add New Task',
                                style: AppText.heading.copyWith(
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    color: AppColors.greyText,
                                    fontSize: 22),
                              ),
                              TextButton(
                                  onPressed: () {
                                    validation.changeTitle(titleText.text);

                                    validation.title.errror == null
                                        ?
                                        // _addTask(context);
                                        {
                                            toDoModel.addNewTask(
                                                titleText.text, descText.text),
                                            titleText.clear(),
                                            descText.clear(),
                                            Navigator.pop(sheetContext),
                                          }
                                        : null;
                                  },
                                  child: Text(
                                    'Save',
                                    style: AppText.subHeading
                                        .copyWith(color: AppColors.darkIndigo),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: titleText,
                            inputFormatters: [],
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: (value) {
                              validation.changeTitle(value);
                            },
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: 'Title*',
                                isDense: true,
                                errorText: validation.title.errror,
                                //  == ''
                                //     ? 'Title Can\'t be Empty'
                                //     : null,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: descText,
                            maxLines: 8,
                            decoration: InputDecoration(
                              isDense: true,
                              hintMaxLines: 4,
                              hintText: 'Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          label: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
              child: Row(
                children: const [
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

  // _addTask(BuildContext ctx) {
  //   if (titleText.text.isNotEmpty) {
  //     ToDoModel().addNewTask(titleText.text, descText.text);
  //     titleText.clear();
  //     descText.clear();
  //     Navigator.pop(ctx);
  //   } else {
  //     setState(() {
  //       hasError = true;
  //     });
  //     print(hasError);
  //     print('not added anything');
  //   }
  // }
}
