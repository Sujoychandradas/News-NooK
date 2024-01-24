import 'package:flutter/material.dart';
import 'package:news_nook/controller/auth_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Thanks for installing This application!',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Create your account ad start your journey with us.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  label: Text('Enter your email address'),
                  icon: Icon(Icons.email)),
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                  label: Text('Enter your password'),
                  icon: Icon(Icons.password)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    AuthController().signup(email.text, password.text, context);
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
                Text('Already have an account? '),
                GestureDetector(
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    })
              ],
            )
          ]),
        ),
      ),
    );
  }
}
