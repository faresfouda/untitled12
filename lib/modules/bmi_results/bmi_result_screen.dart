import 'package:flutter/material.dart';
class BmiScreen_result extends StatelessWidget {
  final int result;
  final int age;
  final bool isMale;

  BmiScreen_result({
    required this.result,
    required this.age,
    required this.isMale
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text(
'RESULT'
),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale? 'Male': 'Female' }',
                style: TextStyle(
                    fontSize: 25.0
                )
            ),
            Text('Age : ${age}',
                style: TextStyle(
                    fontSize: 25.0
                )
            ),
            Text('Result : ${result}',
            style: TextStyle(
              fontSize: 25.0
            )
              ,)
          ],
        ),
      ),
    );
  }
}
