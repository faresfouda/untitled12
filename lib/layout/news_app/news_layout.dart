import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/cubit/cubit.dart';
import 'package:untitled1/layout/news_app/cubit/states.dart';
import 'package:untitled1/modules/search/search_screen.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/networks/remote/duo_helper.dart';

class NewsLayout extends StatelessWidget
{


  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state) {
          var cubit =NewCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                      Icons.search
                  )
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                      Icons.brightness_4_outlined
                  )
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },

    );
  }
}
