import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.deepOrange,
  centerTitle: true,
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: click1 ,),
  title: Text(
    'Fouda Market'
  ) ,
  actions: [
    IconButton( icon: Icon(Icons.search),
      onPressed: click2,
    ),
  ],
),
body: Column (
  children: [
    Column(
      children: [
        Container(
          height:717 ,
          child:
          Image(
              image: NetworkImage
          (
            'https://scontent.fcai21-2.fna.fbcdn.net/v/t39.30808-6/288397886_4897711830357500_7669105521548804229_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=XWgNXwTK07EAX-r5Gok&_nc_ht=scontent.fcai21-2.fna&oh=00_AT_rm1kqZKSjsRuRkRAxL6XzfhjyVDjn-7ZIZdOh4ihGRA&oe=62F06621'
          )
          ),
        ),
      ],
    ),
  ],
),
    );
  }
}
void click1 ()
{
  print('1');
}
void click2 ()
{
  print('2');
}