import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
    validate(s);
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
Widget BuildTaskItem(Map model,context) =>Padding(
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
);