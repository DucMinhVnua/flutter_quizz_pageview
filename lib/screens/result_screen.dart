import 'package:flutter/material.dart';
import 'package:quizzclone/screens/main_menu.dart';
import 'package:quizzclone/ui/shared/app_colors.dart';

class ResultScreen extends StatefulWidget {
  int score;
  ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: double.infinity,
          child: Text("Congratulations",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              )),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: double.infinity,
          child: Text("You Score is",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 34.0,
              )),
        ),
        SizedBox(
          height: 100.0,
        ),
        SizedBox(
          width: double.infinity,
          child: Text("${widget.score}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 85.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: 100.0,
        ),
        RawMaterialButton(
          fillColor: AppColors.secondaryColor,
          padding: EdgeInsets.all(18.0),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainMenu()));
          },
          shape: StadiumBorder(),
          child: Text("Reapeat the quizz",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        )
      ]),
    );
  }
}
