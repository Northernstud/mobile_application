import 'package:flutter/material.dart';
import 'package:mobile_application/ui/login/api.dart';

//implement this in the login_screen interface

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  var usernameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: "username",
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "email address",
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "password",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var data = {
                      "uname": usernameController.text,
                      "uemail": emailController.text,
                      "upassword": passwordController.text
                    };
                    Api.addUser(data);
                  },
                  child: const Text("Create User"))
            ],
          ),
        ));
  }
}
