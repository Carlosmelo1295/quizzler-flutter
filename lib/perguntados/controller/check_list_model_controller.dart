import 'package:perguntados_app/perguntados/model/questions_list_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

int _questionNumber = 0;

class QuizBrain {
  final List<QuestionsListModel> _questionsList = [
    QuestionsListModel(
      questions: 'A gestação dos cavalos-marinhos é feita pelos machos.',
      trueOrfalse: true,
    ),
    QuestionsListModel(
      questions:
          'Por causa do tamanho, as girafas ficam o tempo todo em pé e só se deitam quando vão dar à luz.',
      trueOrfalse: false,
    ),
    QuestionsListModel(
      questions:
          'Os ornitorrincos são os únicos mamíferos venenosos que se tem notícia.',
      trueOrfalse: false,
    )
  ];
  int nextQuestion() =>
      _questionNumber < _questionsList.length - 1 ? _questionNumber++ : 0;

  String getCorrectText() => _questionsList[_questionNumber].questions;

  bool getCorrectAnswer() => _questionsList[_questionNumber].trueOrfalse;

  void isFinish(context, String title) =>
      Alert(context: context, desc: title).show();

  void resetList() => _questionNumber = 0;

//cria o acesso para variável privada
  List questionsList() {
    return _questionsList;
  }
}
