import 'package:flutter/material.dart';
import 'package:travel_friends/constants/constants_page.dart';
import 'package:travel_friends/pages/signup_page.dart';
import 'package:travel_friends/services/auth_service.dart';
import 'package:travel_friends/widgets/controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSwitched = false; // Başlangıçta kapalı olsun

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
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.width * 0.20,
                margin: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    Constants.loginText,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyTextField(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      prefixIcon: const Icon(Icons.person),
                      controller: MyTextField.tEmail,
                    ),
                    MyTextField(
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      prefixIcon: const Icon(Icons.lock),
                      controller: MyTextField.tPassword,
                      obscureTextt: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            ),
                            Text(Constants.switchText),
                          ],
                        ),
                        TextButton(
                            onPressed: () {}, child: Text(Constants.passText)),
                      ],
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
                            title: Constants.loginText,
                            onTap: () {
                              AuthService().login(
                                  email: MyTextField.tEmail.text,
                                  password: MyTextField.tPassword.text);
                            })),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Constants.bottomText,
                    style: const TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      },
                      child: Text(
                        Constants.signupText,
                        style: const TextStyle(fontSize: 15),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
