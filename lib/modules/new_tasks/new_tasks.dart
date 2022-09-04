
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/components/constants.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class  NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var tasks = AppCubit.get(context).tasks;
        return ListView.separated(
            itemBuilder: (context,index)=> BuildTaskItem(tasks[index],context),
            separatorBuilder: (context,index)=> Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: tasks.length);
      },
    );
  }
}
