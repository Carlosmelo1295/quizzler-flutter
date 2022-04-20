import 'package:flutter/material.dart';
import 'package:perguntados_app/perguntados/controller/check_list_model_controller.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  List<Icon> checkList = [];

  @override
  Widget build(BuildContext context) {
    QuizBrain quizBrain = QuizBrain();

    void checkAnswer(bool userAnswer) {
      bool _correctAnswer = quizBrain.getCorrectAnswer();

      setState(() {
        if (checkList.length >= quizBrain.questionsList().length) {
          quizBrain.isFinish(context, 'Fim das perguntas.');
        } else {
          userAnswer == _correctAnswer
              ? checkList.add(
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                )
              : checkList.add(
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                );

          quizBrain.nextQuestion();
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <IconButton>[
                  IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    visualDensity: VisualDensity.comfortable,
                    onPressed: () {
                      setState(() {
                        quizBrain.resetList();
                        checkList.length = 0;
                      });
                    },
                    icon: Icon(
                      Icons.settings_backup_restore_rounded,
                      size: 50,
                      color: Colors.grey[400],
                      semanticLabel: 'Restaurar',
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          quizBrain.getCorrectText(),
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: const Text(
                    'Verdadeiro',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[600],
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
              const Divider(color: Colors.transparent),
              Expanded(
                child: ElevatedButton(
                  child: const Text(
                    'Falso',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
              const Divider(),
              SizedBox(
                height: 30,
                child: Row(
                  children: checkList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
