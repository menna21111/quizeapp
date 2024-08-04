class Questionmodel {
  final String title;
  List answers;

  Questionmodel({required this.title, required this.answers});
}

class Answers {
  final bool iscoorect;
  final String title;

  Answers({required this.iscoorect, required this.title});
}

List<Questionmodel> question = [
  Questionmodel(title: 'who is founder of flutter', answers: [
    Answers(iscoorect: false, title: 'youtube'),
    Answers(iscoorect: true, title: 'google'),
    Answers(iscoorect: false, title: 'instgram'),
    Answers(iscoorect: false, title: 'meta'),
  ]),
  Questionmodel(title: 'who is founder of samsung', answers: [
    Answers(iscoorect: false, title: 'youtube'),
    Answers(iscoorect: true, title: 'google'),
    Answers(iscoorect: false, title: 'instgram'),
    Answers(iscoorect: false, title: 'meta'),
  ]),
  Questionmodel(title: 'who is founder of humwaie', answers: [
    Answers(iscoorect: false, title: 'youtube'),
    Answers(iscoorect: true, title: 'google'),
    Answers(iscoorect: false, title: 'instgram'),
    Answers(iscoorect: false, title: 'meta'),
  ]),
  Questionmodel(title: 'who is founder of HP', answers: [
    Answers(iscoorect: false, title: 'youtube'),
    Answers(iscoorect: true, title: 'google'),
    Answers(iscoorect: false, title: 'instgram'),
    Answers(iscoorect: false, title: 'meta'),
  ])
];
