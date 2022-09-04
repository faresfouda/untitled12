import 'package:flutter/material.dart';

class ValidationForm extends StatelessWidget {

final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Form(
        key: formKey,
        child: Column(
          children:
          [
            TextFormField(
              validator: (value) => "not valid",
            ),
            ElevatedButton(
                onPressed: ()
                {
                  if (formKey.currentState!.validate())
                    {
                      print('valid');
                    }
                },
                child: Text(
                  'submit'
                )
            )
          ],
        )
    )
    );
  }
}
