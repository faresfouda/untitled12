import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/cubit/cubit.dart';
import 'package:untitled1/layout/news_app/cubit/states.dart';
import 'package:untitled1/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

var searchcontroller = TextEditingController();


  @override
  Widget build(BuildContext context)
{
    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchcontroller,
                    onChange: (value)
                    {
                      NewCubit.get(context).getSearch(value);
                    },
                    type: TextInputType.text,
                    validate: (String value)
                    {
                      if (value.isEmpty)
                      {
                        return 'search must not be empty :(';
                      }
                    },
                    label: 'Search',
                    prefix: Icons.search
                ),
              ),
              Expanded(child: articleBuilder(list, context))
            ],
          ),
        );
      },
    );
  }
}
