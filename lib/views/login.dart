import 'package:flutter/material.dart';

import '../controller/auth_controller.dart';

class Login extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                'Login to your account and start using \nthis app.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 80,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    label: Text('Email'), icon: Icon(Icons.email)),
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    label: Text('Password'), icon: Icon(Icons.password)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot your password?  ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/passwordreset');
                      },
                      child: Text(
                        'Reset Now',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      AuthController()
                          .signIN(email.text, password.text, context);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Don\'t have an account? '),
                  GestureDetector(
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                    child: IconButton(
                        style: ButtonStyle(
                          iconColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                        ),
                        onPressed: () {
                          AuthController().signInWithGoogle();
                        },
                        icon: Image.asset(
                          "assets/images/google.png",
                          height: 50,
                          width: 50,
                        ))),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
