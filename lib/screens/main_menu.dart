import 'package:flutter/material.dart';
import 'package:quizzclone/screens/quizz_screen.dart';
import 'package:quizzclone/ui/shared/app_colors.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                child: Text("Quizz App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold)),
              ),
              Center(
                child: Center(
                    child: RawMaterialButton(
                        shape: const StadiumBorder(),
                        fillColor: AppColors.secondaryColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizzScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Text("Start the Quizz",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold)),
                        ))),
              ),
              Center(
                  child: Text("Made with ❤ by MobiPlus",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ))),
            ],
          ),
        ));
  }
}
