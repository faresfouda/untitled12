import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/counter/cubit/states.dart';

import 'cubit/cubit.dart';

class Counter_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => CounterCubit() ,
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return  Scaffold(
            appBar: AppBar(
              title: Text(
                  'Counter'
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).Minus();
                  },
                      child: Text('MINUS',
                        style:TextStyle(
                            fontSize: 30.0
                        )
                        ,)
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0),
                    child:
                    Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(onPressed: ()
                  {

                    CounterCubit.get(context).Plus();
                  },
                      child: Text('PLUS',
                          style:TextStyle(
                              fontSize: 30.0
                          )
                      )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


