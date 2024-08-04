import 'package:flutter/material.dart';

import '../models/questionmodel.dart';
import 'dart:ui';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  bool isSelected = false;
  Answers? selectedAnswer;
  bool islastquestion = false;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        SizedBox(),
          const Text(
            'Simple Quize APP',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        
          Row(
            children: [
              Text(
                'question  ${index + 1} / ${question.length}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Stack(clipBehavior: Clip.none, children: [
            Container(
              height: 110,
              width: 370,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Text(question[index].title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            ),
            const Positioned(
              left: -50,
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
              ),
            ),
            const Positioned(
              right: -50,
              child: Center(
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            const Positioned(
              top: -70,
              left: 125,
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                )),
              ),
            )
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < question[index].answers.length; i++)
                custombutton(question[index].answers[i])
                ,
            ],
          ),
          nextButton(),SizedBox()
        ],
      ),
    );
  }

  custombutton(Answers ans) {
    isSelected = ans ==
        selectedAnswer; //is seleected is true if ans ==selectesd ans and it will be true if we pressed on it that is if statment
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width:300 ,
        child: MaterialButton(
          
          onPressed: () {
            setState(() {
              selectedAnswer = ans;
            });
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: isSelected ? Colors.green : Colors.white,
          child: Center(
              child: Text(
            ans.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  nextButton() {
    if (index == question.length - 1) {
      islastquestion = true;
    }
    return SizedBox(
      width: 250,
      child: MaterialButton( color:  Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            if (selectedAnswer!.iscoorect) {
              //statment mean is correct is true
              setState(() {
                score++;
              });
            } 
            if (islastquestion) {
              showDialog(
                  barrierDismissible: false, //علشان ميقدرش يطلع من showdiolage
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: score > question.length * .6
                          ? Text('  scuess | score is $score')
                          : Text('  fail  | score is $score'),
                      content: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            score = 0;
                            index = 0;
                            selectedAnswer = null;
                            islastquestion = false;
                            Navigator.pop(context);
                          });
                        },
                        child: Text('reset'),
                      ),
                    );
                  });
            } else {
              setState(() {
                index++;
                selectedAnswer = null;
                isSelected = false;
              });
            }
          },
          child: islastquestion ? const Text('subimt',style: TextStyle(fontWeight: FontWeight.bold),) : const Text('next',style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
