
import 'package:flutter/material.dart';
import 'package:news_nook/controller/auth_controller.dart';
import 'package:news_nook/views/toast.dart';

class PassReset extends StatelessWidget {
  PassReset({super.key});
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Forget your\npassword?',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                'enter your email to reset password.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: email,
                decoration:
                    InputDecoration(hintText: 'Email', icon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      if (email.text.isNotEmpty) {
                        AuthController().resetPassword(email.text, context);
                      } else {
                        Toast.show(context, 'Email Can\'t be empty');
                      }
                    },
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
