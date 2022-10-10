import 'package:bloc/bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: ()
        {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function ?onSubmit,
  Function ?onChange,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData ?suffix,
  Function ?suffixPressed,
  Function ?onTap,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: (s)
  {
    onSubmit!(s);
  },
  onChanged: (s)
  {
    onChange!();
  },
  validator: (s)
  {
   return validate(s);
  },
  onTap:()
  {
    onTap!();
  },
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: (){
        suffixPressed!();
      },
      icon: Icon(
        suffix,
      ),
    ) : null,
    border: OutlineInputBorder(),
  ),
);
Widget BuildTaskItem(Map model,context) =>Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction)
  {
    AppCubit.get(context).deletedata(id: model['id']);
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(

      children:

      [

        CircleAvatar(

          radius: 40.0,

          child: Text(

              '${model['time']}'

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize:MainAxisSize.min ,

            children:

            [

              Text('${model['title']}',

                style: TextStyle(

                  fontSize: 24.0,

                  fontWeight: FontWeight.bold,

                ),

              ),

              Text('${model['date']}',

                style: TextStyle(

                  fontSize: 20.0,

                  fontWeight: FontWeight.bold,

                ),

              )

            ],

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        IconButton(

          onPressed: ()

          {

            AppCubit.get(context).updatedata(

              status: 'done',

              id: model['id'],);

          },

          icon: Icon(Icons.check_box),

          color: Colors.green,

        ),

        SizedBox(

          width: 20.0,

        ),

        IconButton(

          onPressed: ()

          {

            AppCubit.get(context).updatedata(

              status: 'Archive',

              id: model['id'],);

          },

          icon: Icon(Icons.archive),

        ),

      ],

    ),

  ),

);

Widget tasksBuilder({
  required List <Map> tasks ,
}) => ConditionalBuilder(
condition: tasks.length>0  ,
builder: (context) =>ListView.separated(
itemBuilder: (context,index)=> BuildTaskItem(tasks[index],context),
separatorBuilder: (context,index)=>myDivider (),
itemCount: tasks.length),
fallback: (context) => Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children:
[
Icon(
Icons.menu,
size: 100.0,
color: Colors.grey,
),
Text(
'No tasks yet, Please add some tasks  ',
style: TextStyle(
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
),
],
),
)
);
Widget myDivider () =>Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);
Widget BuildArticleItem (article,context) =>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height:120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover
            )
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      )
    ],
  ),
);

Widget articleBuilder(list,context)=>ConditionalBuilder(
    condition:  list.length > 0,
    builder: (context)=> ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=> BuildArticleItem(list[index],context),
        separatorBuilder: (context,index)=> myDivider (),
        itemCount: 10
    ),
    fallback: (context)=>Center(child: CircularProgressIndicator())
);

void navigateTo(context,widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=> widget,
  ),
);