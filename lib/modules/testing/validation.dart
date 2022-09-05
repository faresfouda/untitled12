import 'package:flutter/material.dart';

class ValidationForm extends StatelessWidget {

final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              TextFormField(
                validator: (value)
                {
                  if (value?.length == 0)
                    {
                      return "not valid";
                    }
                },
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
          ),
        )
    )
    );
  }
}
