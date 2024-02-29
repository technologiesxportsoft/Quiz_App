class NavigateQuestion {
  final int id;
  final String text;
  final List<NavigationsOption> options;
  bool isLocked;
  NavigationsOption? selectedWiidgetOption;
  NavigationsOption? correctAnswer;

  NavigateQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  NavigateQuestion copyWith() {
    return NavigateQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              NavigationsOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class NavigationsOption {
  final String text;
  final bool isCorrect;

  const NavigationsOption({
    required this.text,
    required this.isCorrect,
  });
}

final navigateQuestionsList = [
  NavigateQuestion(
    text: "IWhat is the life span of RBC?",
    options: [
      const NavigationsOption(text: "130 days", isCorrect: false),
      const NavigationsOption(text: "110 days", isCorrect: false),
      const NavigationsOption(text: "120 days", isCorrect: true),
      const NavigationsOption(text: "160 days", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const NavigationsOption(text: "120 days", isCorrect: true),
  ),
  NavigateQuestion(
    text: "A male cow is called?",
    options: [
      const NavigationsOption(text: "Ox", isCorrect: true),
      const NavigationsOption(text: "Dog", isCorrect: false),
      const NavigationsOption(
          text: "Sheep", isCorrect: false),
      const NavigationsOption(text: "Monkey", isCorrect: false),
    ],
    id: 1,
    correctAnswer:
        const NavigationsOption(text: "Ox)", isCorrect: true),
  ),
  NavigateQuestion(
    text:
        "What is Earth’s only natural satellite?",
    options: [
      const NavigationsOption(text: "Moon", isCorrect: true),
      const NavigationsOption(text: "Sun", isCorrect: false),
      const NavigationsOption(text: "Mars", isCorrect: false),
      const NavigationsOption(text: "Venus", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const NavigationsOption(text: "Moon", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        "What part of the body helps you move?",
    options: [
      const NavigationsOption(text: "Muscles", isCorrect: true),
      const NavigationsOption(text: "Eyes", isCorrect: false),
      const NavigationsOption(text: "Lungs", isCorrect: false),
      const NavigationsOption(text: "Pancreas", isCorrect: false),
    ],
    id: 3,
    correctAnswer:
        const NavigationsOption(text: "Muscles", isCorrect: true),
  ),
  // other 4
  NavigateQuestion(
    text:
        "What star shines in the day and provides light?",
    options: [
      const NavigationsOption(text: "Moon", isCorrect: false),
      const NavigationsOption(text: "Venus", isCorrect: false),
      const NavigationsOption(text: "Mars", isCorrect: false),
      const NavigationsOption(text: "Sun", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const NavigationsOption(
      text: "Sun",
      isCorrect: true,
    ),
  ),
  NavigateQuestion(
    text:
        "Which shape is a round?",
    options: [
      const NavigationsOption(
          text: "Rectangle", isCorrect: false),
      const NavigationsOption(text: "Circle", isCorrect: true),
      const NavigationsOption(
          text: "Square", isCorrect: false),
      const NavigationsOption(
          text: "Triangle", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const NavigationsOption(
        text: "Circle", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        "Your hands have four fingers and a ____.",
    options: [
      const NavigationsOption(text: "Knee", isCorrect: false),
      const NavigationsOption(
          text: "Ankle", isCorrect: false),
      const NavigationsOption(text: "Elbow", isCorrect: false),
      const NavigationsOption(text: "Thumb", isCorrect: true),
    ],
    id: 6,
    correctAnswer:
        const NavigationsOption(text: "Thumb", isCorrect: true),
  ),
  NavigateQuestion(
    text:
        "What is the boiling point of water?",
    options: [
      const NavigationsOption(text: "25°C", isCorrect: false),
      const NavigationsOption(text: "50°C", isCorrect: false),
      const NavigationsOption(text: "75°C", isCorrect: false),
      const NavigationsOption(text: "100°C", isCorrect: true),
    ],
    id: 7,
    correctAnswer: const NavigationsOption(text: "100°C", isCorrect: true),
  ),

  NavigateQuestion(
    text:
        "How does a dog express happiness?",
    options: [
      const NavigationsOption(text: "Twitching ears", isCorrect: false),
      const NavigationsOption(text: "Moving head", isCorrect: false),
      const NavigationsOption(text: "Closing eyes", isCorrect: false),
      const NavigationsOption(text: "Wagging tail", isCorrect: true),
    ],
    id: 8,
    correctAnswer:
        const NavigationsOption(text: "Wagging tail", isCorrect: true),
  ),
];
