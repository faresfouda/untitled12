import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/shared/cubit/states.dart';

import '../../modules/archived_taskes/archived_tasks.dart';
import '../../modules/done_tasks/done_tasks.dart';
import '../../modules/new_tasks/new_tasks.dart';

class AppCubit extends Cubit <AppStates>
{
  AppCubit () : super (AppInitialState());
  
  static AppCubit get(context) => BlocProvider.of(context);
  int currentindex= 0;
  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  List<Widget> screens =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  void changeindex(index)
  {
    currentindex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;
  List<Map> tasks = [];

  void creatDataBase()
  {
     openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version)
        {
          print('Data base created');
          database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT , date TEXT ,time TEXT , status TEXT)').then((value)
          {
            print('table created');
          }).catchError((error)
          {
            print('Error when creating table ${error.toString()}');
          });
        },
        onOpen: (database)
        {
          getDataFromDatabase(database);
          print(tasks);
          print('database opened');

        }
    ).then((value) 
     {
       database = value ;

       emit(AppCreateDataBaseState());
     });
  }
   insertDataBase({
    required String title,
    required String date,
    required String time,

  }) async
  {
    await database.transaction((txn)
    async {
      txn.rawInsert('INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")'
      )
          .then((value)
      {
        print('$value Inserted succesfully');
        emit(AppInsertDataBaseState());

          getDataFromDatabase(database);
          // {
          //   tasks = value;
          //   emit(AppGetDataBaseState());
          //
          // });
      }
      ).catchError((error)
      {
        print('Error when inserting new record ${error.toString()}');
      });
    });
  }
  void getDataFromDatabase (database)
  {
    emit(AppGetDataBaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value)
     {
       tasks = value;
       print(tasks);
       value.forEach((element) {
         print(element['status']);
       });
       emit(AppGetDataBaseState());

     });
  }

  void updatedata ({
    required String status,
    required int id,

  }) async
  {
     database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE name = ?',
        ['$status', id]).then((value)
     {

       emit(AppUpdateDataBaseState());
     });

  }

  bool isBottomsheetShown= false;
  IconData fabIcon = Icons.edit;

  void changebottomstate ({
  required bool isShow,
  required IconData icon,
})
  {
    isBottomsheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

}