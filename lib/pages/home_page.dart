import 'package:flutter/material.dart';
import 'package:travel_friends/constants/constants_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Constants.img), fit: BoxFit.cover)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.33,
                right: MediaQuery.of(context).size.width *
                    0.05, // yatayda ortalamak için
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Container(
                  // positioned daki genişlik ve yükseklik çocuktakini override eder.
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(30))),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TextField(),
                      const TextField(),
                      const TextField(),
                      const TextField(),
                      Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 94, 163, 140),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Ara",
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
