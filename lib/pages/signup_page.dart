import 'package:flutter/material.dart';
import 'package:travel_friends/constants/constants_page.dart';
import 'package:travel_friends/services/auth_service.dart';
import 'package:travel_friends/widgets/controller.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // klavye içeriğin üzerini kapattığında hata vermemesi için
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.5,
                  image: AssetImage(Constants.bgimage),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Text(
                          Constants.signupText,
                          style: const TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyTextField(
                      labelText: 'User Name',
                      hintText: 'Enter Your User Name',
                      prefixIcon: const Icon(Icons.person),
                      controller: MyTextField.tName,
                    ),
                    MyTextField(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      prefixIcon: const Icon(Icons.mail),
                      controller: MyTextField.tEmail,
                    ),
                    MyTextField(
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      prefixIcon: const Icon(Icons.lock),
                      controller: MyTextField.tPassword,
                      obscureTextt: true,
                    ),
                    MyTextField(
                      labelText: ' Confirm Password',
                      hintText: 'Ente Your Confirm Password',
                      prefixIcon: const Icon(Icons.lock_open),
                      controller: MyTextField.tConfirmpassword,
                      obscureTextt: true,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.blue, Colors.purple])),
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: activatebutton(
                          title: Constants.signupText,
                          onTap: () => AuthService().signUp(
                              name: MyTextField.tName.text,
                              email: MyTextField.tEmail.text,
                              password: MyTextField.tPassword.text,
                              confirmPassword:
                                  MyTextField.tConfirmpassword.text),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
