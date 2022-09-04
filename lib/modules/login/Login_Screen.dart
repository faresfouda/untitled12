
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();

  var passcontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 50.0,

                    ),
                  ),
                  SizedBox(
                      height: 40.0
                  ),
                  defaultFormField(
                    controller: emailcontroller,

                    prefix: Icons.email,
                    validate: (value) => "not valid",
                    label: 'Email adress',
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                      height: 20.0
                  ),
                  defaultFormField(
                    controller: passcontroller,
                    isPassword: isPassword ,
                    suffixPressed: ()
                    {
                      setState(() {
                        isPassword=!isPassword;
                      });
                    },
                    prefix: Icons.lock,
                    validate: (value) => "not valid",
                    label: 'Password',
                    type: TextInputType.visiblePassword,
                    suffix: isPassword? Icons.visibility:Icons.visibility_off,
                  ),
                  SizedBox(
                      height: 20.0
                  ),
                  defaultButton(
                    text: 'login',
                    function: ()
                    {
                      if (formKey.currentState!.validate())
                      {
                      print(emailcontroller.text);
                      print(passcontroller.text);
                      }
                    },
                  ),
                  SizedBox(
                      height: 10.0
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have account? '),
                      TextButton(onPressed: () {},
                          child: Text('Register')
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
