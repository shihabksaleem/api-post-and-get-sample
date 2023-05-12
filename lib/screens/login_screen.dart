import 'package:flutter/material.dart';
import 'package:interview_task/screens/get_details_screen.dart';

class LoginValidation extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Login Page"),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5UMDRmpb8vz1D2QB0hAKxcoOZsXe0epKhyg&usqp=CAU')),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                //we can use validator property
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    label: Text("Username"),
                    hintText: "Username must be your email address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                    )),
                validator: (text) {
                  if (text!.isEmpty || !(text.contains('@')) || text == null) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
                validator: (password) {
                  if (password == null ||
                      password.length < 6 ||
                      password.isEmpty) {
                    return 'Password  length should greater than 6/ should not be null';
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.done,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GetEployeeDetailsScreen()));
                      }
                    },
                    child: Text("Login")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
