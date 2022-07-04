import 'package:flutter/material.dart';
import 'package:quizzclone/data/question_example.dart';
import 'package:quizzclone/screens/result_screen.dart';
import 'package:quizzclone/ui/shared/app_colors.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  State<QuizzScreen> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  String btnText = "Next Question";
  bool btnPressed = false;
  bool answered = false;
  int score = 0;
  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
              onPageChanged: (index) {
                if (index == questions.length - 1) {
                  setState(() {
                    btnText = "See Results";
                  });
                }

                setState(() {
                  answered = false;
                });
              },
              controller: _controller,
              itemCount: questions.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(children: [
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: Text("Question ${index + 1}/10",
                        style: TextStyle(color: Colors.white, fontSize: 28.0)),
                  ),
                  Divider(color: Colors.white),
                  SizedBox(
                    width: double.infinity,
                    child: Text("${questions[index].question}",
                        style: TextStyle(color: Colors.white, fontSize: 22.0)),
                  ),
                  Spacer(),
                  for (int i = 0; i < questions[index].answers!.length; i++)
                    Container(
                        margin: EdgeInsets.only(
                            bottom: 20.0, left: 12.0, right: 12.0),
                        height: 50,
                        width: double.infinity,
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          fillColor: btnPressed
                              ? questions[index].answers!.values.toList()[i]
                                  ? Colors.green
                                  : Colors.red
                              : AppColors.secondaryColor,
                          onPressed: !answered
                              ? () {
                                  if (questions[index]
                                      .answers!
                                      .values
                                      .toList()[i]) {
                                    score++;
                                  }
                                  setState(() {
                                    btnPressed = true;
                                    answered = true;
                                  });
                                }
                              : null,
                          child: Text(
                              "${questions[index].answers!.keys.toList()[i]}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        )),
                  Spacer(),
                  RawMaterialButton(
                      elevation: 0.0,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(18.0),
                      fillColor: AppColors.secondaryColor,
                      onPressed: () {
                        if (_controller.page!.toInt() == questions.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen(score)));
                        } else {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInExpo);

                          setState(() {
                            btnPressed = false;
                          });
                        }
                      },
                      child:
                          Text(btnText, style: TextStyle(color: Colors.white))),
                  Spacer(),
                ]);
              }),
        ));
  }
}
