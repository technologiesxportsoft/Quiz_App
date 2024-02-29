import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/layout_questions_model.dart';
import 'package:flutter_quiz/models/naviagation_questions_model.dart';
import 'package:flutter_quiz/models/state_questions_model.dart';
import 'package:flutter_quiz/models/widget_questions_model.dart';

const Color cardColor = Color(0xFF4993FA);

class FlutterTopics {
  final int id;
  final String topicName;
  final IconData topicIcon;
  final Color topicColor;
  final List<dynamic> topicQuestions;

  FlutterTopics({
    required this.id,
    required this.topicColor,
    required this.topicIcon,
    required this.topicName,
    required this.topicQuestions,
  });
}

final List<FlutterTopics> flutterTopicsList = [
  FlutterTopics(
    id: 0,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.square_stack_3d_up,
    topicName: "Flutter",
    topicQuestions: widgetQuestionsList,
  ),
  FlutterTopics(
    id: 1,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.book_fill,
    topicName: "General Knowledge",
    topicQuestions: stateQuestionsList,
  ),
  FlutterTopics(
    id: 2,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.tv,
    topicName: "Computer",
    topicQuestions: layOutQuestionsList,
  ),
  FlutterTopics(
    id: 3,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.eyedropper_halffull,
    topicName: "Science",
    topicQuestions: navigateQuestionsList,
  ),
];
