import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/modules/archived_taskes/archived_tasks.dart';
import 'package:untitled1/modules/done_tasks/done_tasks.dart';
import 'package:untitled1/modules/new_tasks/new_tasks.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

import '../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (Context) => AppCubit()..creatDataBase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state)
        {
          if (state is AppInsertDataBaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentindex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDataBaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentindex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomsheetShown) {
                  if (formkey.currentState!.validate()) {
                    print('value is valid');
                    cubit.insertDataBase(
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text
                    );
                    // insertDataBase(
                    //   date:dateController.text,
                    //   time:timeController.text,
                    //   title: titleController.text,
                    // ).then((value)
                    // {
                    //   Navigator.pop(context);
                    //   isBottomsheetShown=false;
                    //   // setState(()
                    //   // {
                    //   //   fabIcon = Icons.edit;
                    //   // });
                    // });

                  }
                } else {
                  scaffoldkey.currentState!
                      .showBottomSheet((context) => Container(
                            color: Colors.grey[100],
                            padding: EdgeInsets.all(20.0),
                            child: Form(
                              key: formkey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                      controller: titleController,
                                      type: TextInputType.text,
                                      validate: (value) => "not valid",
                                      label: 'Task Title',
                                      prefix: Icons.title),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  defaultFormField(
                                      controller: timeController,
                                      type: TextInputType.datetime,
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                          print(value.format(context));
                                        });
                                      },
                                      validate: ( value) => "not valid",
                                      label: 'Task Time',
                                      prefix: Icons.watch_later),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  defaultFormField(
                                      controller: dateController,
                                      type: TextInputType.datetime,
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(2030))
                                            .then((value) {
                                          print(DateFormat.yMMMd()
                                              .format(value!));
                                          dateController.text =
                                              DateFormat.yMMMd().format(value);
                                        });
                                      },
                                      validate: ( value) => "not valid",
                                      label: 'Task date',
                                      prefix: Icons.calendar_month),
                                ],
                              ),
                            ),
                          ))
                      .closed
                      .then((value) {
                    cubit.changebottomstate(
                        isShow: false,
                        icon: Icons.edit);
                  });
                  cubit.changebottomstate(
                      isShow: true,
                      icon: Icons.add
                  );
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              onTap: (index) {
                AppCubit.get(context).changeindex(index);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline_outlined),
                    label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: 'Archive'),
              ],
            ),
          );
        },
      ),
    );
  }


}
