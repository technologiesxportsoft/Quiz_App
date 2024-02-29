class StateQuestion {
  final int id;
  final String text;
  final List<StateOption> options;
  bool isLocked;
  StateOption? selectedWiidgetOption;
  StateOption? correctAnswer;

  StateQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });
  StateQuestion copyWith() {
    return StateQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              StateOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class StateOption {
  final String text;
  final bool isCorrect;

  const StateOption({
    required this.text,
    required this.isCorrect,
  });
}

final stateQuestionsList = [
  StateQuestion(
    text:
        "The Constitution of India guarantees the right to education to all children in the age group of:",
    options: [
      const StateOption(text: "6-14 years", isCorrect: true),
      const StateOption(text: "6-18 years", isCorrect: false),
      const StateOption(text: "6-10 years", isCorrect: false),
      const StateOption(text: "6-12 years", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const StateOption(text: "6-14 years", isCorrect: true),
  ),
  StateQuestion(
    text: "Name of the first Aircraft Carrier Indian Ship? ",
    options: [
      const StateOption(text: "I.N.S. Vikrant", isCorrect: true),
      const StateOption(text: "Sukhoi", isCorrect: false),
      const StateOption(text: "HAL Tejas", isCorrect: false),
      const StateOption(text: "SEPECAT", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const StateOption(text: "I.N.S. Vikrant", isCorrect: true),
  ),
  StateQuestion(
    text: "Cow milk is a rich source of which vitamin?",
    options: [
      const StateOption(text: "Vitamin A", isCorrect: false),
      const StateOption(text: "Vitamin B", isCorrect: true),
      const StateOption(text: "Vitamin C", isCorrect: false),
      const StateOption(text: "Vitamin D", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const StateOption(text: "Vitamin A", isCorrect: true),
  ),

  StateQuestion(
    text: "Where was the first Post Office opened in India?",
    options: [
      const StateOption(text: "Kolkata in 1727", isCorrect: true),
      const StateOption(text: "Asaam in 1827", isCorrect: false),
      const StateOption(text: "Madras in 1928", isCorrect: false),
      const StateOption(text: "Delhi in 1230", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const StateOption(text: "Kolkata in 1727", isCorrect: true),
  ),
  // other 4
  StateQuestion(
    text: "Brain of computer is?",
    options: [
      const StateOption(text: "CPU", isCorrect: true),
      const StateOption(text: "MOUSE", isCorrect: false),
      const StateOption(text: "KEYBOARD", isCorrect: false),
      const StateOption(text: "MONITOR", isCorrect: false),
    ],
    id: 4,
    correctAnswer: const StateOption(text: "CPU", isCorrect: true),
  ),
  StateQuestion(
    text: "Smallest state of India is?",
    options: [
      const StateOption(text: "Mumbai", isCorrect: false),
      const StateOption(text: "Punjab", isCorrect: false),
      const StateOption(text: "Goa", isCorrect: true),
      const StateOption(text: "Assam", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const StateOption(text: "Goa", isCorrect: true),
  ),

  StateQuestion(
    text: "Fastest animal on earth is?",
    options: [
      const StateOption(text: "Lion", isCorrect: false),
      const StateOption(text: "Cat", isCorrect: false),
      const StateOption(text: "Monkey", isCorrect: false),
      const StateOption(text: "Cheetah", isCorrect: true),
    ],
    id: 6,
    correctAnswer: const StateOption(text: "Cheetah", isCorrect: true),
  ),
  StateQuestion(
    text: "Which plant grows in desert?",
    options: [
      const StateOption(text: "Palm Tree", isCorrect: false),
      const StateOption(text: "Apple", isCorrect: false),
      const StateOption(text: "Cactus", isCorrect: true),
      const StateOption(text: "Mango", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const StateOption(text: "Cactus", isCorrect: true),
  ),

  StateQuestion(
    text: "Which flower is white in colour?",
    options: [
      const StateOption(text: "Jasmine", isCorrect: true),
      const StateOption(text: "Marigold", isCorrect: false),
      const StateOption(text: "Geranium", isCorrect: false),
      const StateOption(text: "Rose", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const StateOption(text: " Jasmine", isCorrect: true),
  ),

  StateQuestion(
    text: "Shape of Egg is?",
    options: [
      const StateOption(text: "Oval", isCorrect: true),
      const StateOption(text: "Square", isCorrect: false),
      const StateOption(text: "Circle", isCorrect: false),
      const StateOption(text: "Ecllipse", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const StateOption(text: "Oval", isCorrect: true),
  ),

  StateQuestion(
    text: "Sun is a?",
    options: [
      const StateOption(text: "Star", isCorrect: true),
      const StateOption(text: "House", isCorrect: false),
      const StateOption(text: "Galaxy", isCorrect: false),
      const StateOption(text: "Universe", isCorrect: false),
    ],
    id: 10,
    correctAnswer: const StateOption(text: "Star", isCorrect: true),
  ),

  StateQuestion(
    text: "Gateway of India is located at?",
    options: [
      const StateOption(text: "Delhi", isCorrect: false),
      const StateOption(text: "Banglore", isCorrect: false),
      const StateOption(text: "Pune", isCorrect: false),
      const StateOption(text: "Mumbai", isCorrect: true),
    ],
    id: 11,
    correctAnswer: const StateOption(text: "Mumbai", isCorrect: true),
  ),
];
