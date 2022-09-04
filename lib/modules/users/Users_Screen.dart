import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';


class UsersScreen extends StatelessWidget {
  List<UserModel> users= [
    UserModel(
      id: 1,
      name: 'fares yasser fouda',
      phone: '2321324424'
    ),
    UserModel(
        id: 2,
        name: 'fady yasser fouda',
        phone: '6634534424'
    ),
    UserModel(
        id: 3,
        name: 'farah yasser fouda',
        phone: '554524424'
    ),
    UserModel(
        id: 1,
        name: 'fares yasser fouda',
        phone: '2321324424'
    ),
    UserModel(
        id: 1,
        name: 'fares yasser fouda',
        phone: '2321324424'
    ),
    UserModel(
        id: 1,
        name: 'fares yasser fouda',
        phone: '2321324424'
    ),
    UserModel(
        id: 1,
        name: 'fares yasser fouda',
        phone: '2321324424'
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text
          (
          'Users'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>buildeUserItem(users[index]),
          separatorBuilder: (context,index)=> Container(
            height: 1.0,
            color: Colors.grey[300],
            width: double.infinity,
          ) ,
          itemCount: users.length
      )
    );
  }
  Widget buildeUserItem(UserModel user) =>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
  children: [
  CircleAvatar(
  radius: 25,
  child: Text(
  '${user.id}',
  style: TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold
  ),
  ),
  ),
  SizedBox(width: 20.0,),
  Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  '${user.name}',
  style: TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold
  ),
  ),
  Text('${user.phone}')
  ],

  )
  ],
  ),
  );
}
