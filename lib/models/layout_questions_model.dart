class LayOutQuestion {
  final int id;
  final String text;
  final List<LayOutOption> options;
  bool isLocked;
  LayOutOption? selectedWiidgetOption;
  LayOutOption? correctAnswer;
  // final int timeSeconds;

  LayOutQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
    //  required this.timeSeconds
  });

  LayOutQuestion copyWith() {
    return LayOutQuestion(
      id: id,
      text: text,
      options: options
          .map(
            (option) =>
                LayOutOption(text: option.text, isCorrect: option.isCorrect),
          )
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class LayOutOption {
  final String text;
  final bool isCorrect;

  const LayOutOption({
    required this.text,
    required this.isCorrect,
  });
}

final layOutQuestionsList = [
  LayOutQuestion(
    text: "Google is a Browser or a Search Engine?",
    options: [
      const LayOutOption(text: "Browser", isCorrect: false),
      const LayOutOption(text: "Search Engine", isCorrect: true),
      const LayOutOption(
          text: "Both Browser and Search Engine", isCorrect: false),
      const LayOutOption(
          text: "Neither Browser nor Search Engine", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const LayOutOption(text: "Search Engine", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Printer is an example of which types of device, Output or Input?",
    options: [
      const LayOutOption(text: "Input", isCorrect: false),
      const LayOutOption(text: "Output", isCorrect: true),
      const LayOutOption(text: "Storage", isCorrect: false),
      const LayOutOption(text: "None of the above mentioned", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const LayOutOption(text: "Output", isCorrect: true),
  ),

  LayOutQuestion(
    text: "What is the full form of RAM?",
    options: [
      const LayOutOption(text: "Random Access Memory", isCorrect: true),
      const LayOutOption(text: "Read And Memory", isCorrect: false),
      const LayOutOption(text: "Random All Memory", isCorrect: false),
      const LayOutOption(text: "None of the above mentioned", isCorrect: false),
    ],
    id: 2,
    correctAnswer:
        const LayOutOption(text: "Random Access Memory", isCorrect: true),
  ),

  LayOutQuestion(
    text: "Which is a single integrated circuit?",
    options: [
      const LayOutOption(text: "Gate", isCorrect: true),
      const LayOutOption(text: "Mother Board", isCorrect: false),
      const LayOutOption(text: "Chip", isCorrect: false),
      const LayOutOption(text: "CPU", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const LayOutOption(text: "Gate ", isCorrect: true),
  ),
  // other 4
  LayOutQuestion(
    text: "What is the full form of lP?",
    options: [
      const LayOutOption(text: "Interface program", isCorrect: false),
      const LayOutOption(text: "Interface protocol", isCorrect: false),
      const LayOutOption(text: "Internet program", isCorrect: false),
      const LayOutOption(text: "Internet protocol ", isCorrect: true),
    ],
    id: 4,
    correctAnswer:
        const LayOutOption(text: "Internet protocol ", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Which one is a ‘text editor’ for Microsoft Windows",
    options: [
      const LayOutOption(text: "MS Word", isCorrect: false),
      const LayOutOption(text: "Ms Excel", isCorrect: false),
      const LayOutOption(text: "WordPad", isCorrect: false),
      const LayOutOption(text: "Notepad", isCorrect: true),
    ],
    id: 5,
    correctAnswer: const LayOutOption(text: "Notepad", isCorrect: true),
  ),

  LayOutQuestion(
    text: "Total number of function keys in a computer keyboard?",
    options: [
      const LayOutOption(text: "18", isCorrect: false),
      const LayOutOption(text: "10", isCorrect: false),
      const LayOutOption(text: "6", isCorrect: false),
      const LayOutOption(text: "12 ", isCorrect: true),
    ],
    id: 6,
    correctAnswer: const LayOutOption(text: "12 ", isCorrect: true),
  ),
  LayOutQuestion(
    text: "What is the full form of PDF?",
    options: [
      const LayOutOption(text: "Printed Document Format", isCorrect: false),
      const LayOutOption(text: "Public Document Format", isCorrect: false),
      const LayOutOption(text: "Portable Document Format", isCorrect: true),
      const LayOutOption(text: "Published Document Format", isCorrect: false),
    ],
    id: 7,
    correctAnswer:
        const LayOutOption(text: "Portable Document Format", isCorrect: true),
  ),
];
