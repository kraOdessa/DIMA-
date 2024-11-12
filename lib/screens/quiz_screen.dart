import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the size of an int in Java?',
      'options': ['2 bytes', '4 bytes', '8 bytes', '16 bytes'],
      'answer': '4 bytes'
    },
    {
      'question': 'Who is known as the father of Java?',
      'options': ['James Gosling', 'Dennis Ritchie', 'Bjarne Stroustrup', 'Guido van Rossum'],
      'answer': 'James Gosling'
    },
    {
      'question': 'Which keyword is used to inherit a class in Java?',
      'options': ['implement', 'extends', 'inherit', 'derive'],
      'answer': 'extends'
    },
    {
      'question': 'What is the size of an int in Java?',
      'options': ['2 bytes', '4 bytes', '8 bytes', '16 bytes'],
      'answer': '4 bytes'
    },
    {
      'question': 'Which company developed Java?',
      'options': ['Microsoft', 'Apple', 'Sun Microsystems', 'Google'],
      'answer': 'Sun Microsystems'
    },
    {
      'question': 'What keyword is used to create an object in Java?',
      'options': ['new', 'create', 'object', 'init'],
      'answer': 'new'
    },
    {
      'question': 'Which of these is a reserved keyword in Java?',
      'options': ['class', 'object', 'method', 'function'],
      'answer': 'class'
    },
    {
      'question': 'Which method is the entry point of any Java program?',
      'options': ['start()', 'main()', 'run()', 'execute()'],
      'answer': 'main()'
    },
    {
      'question': 'Which of these is not a Java data type?',
      'options': ['int', 'float', 'boolean', 'string'],
      'answer': 'string'
    },
    {
      'question': 'Which keyword is used for inheritance in Java?',
      'options': ['extends', 'implements', 'inherits', 'derives'],
      'answer': 'extends'
    },
    {
      'question': 'Which symbol is used to end a statement in Java?',
      'options': ['.', ';', ':', ','],
      'answer': ';'
    },
    {
      'question': 'Which of these is not an access modifier in Java?',
      'options': ['public', 'protected', 'default', 'constant'],
      'answer': 'constant'
    },
    {
      'question': 'Which operator is used to compare two values?',
      'options': ['=', '==', '===', '<=>'],
      'answer': '=='
    }
    // Add more questions as needed
  ];

  int currentQuestionIndex = 0;
  int score = 0;
  bool isQuizCompleted = false;

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentQuestionIndex]['answer']) {
      score++;
    }

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        isQuizCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Java Quiz'),
      ),
      body: isQuizCompleted ? buildResultScreen() : buildQuestionScreen(),
    );
  }

  Widget buildQuestionScreen() {
    double progress = (currentQuestionIndex + 1) / questions.length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Linear progress indicator with themed color
          LinearProgressIndicator(
            value: progress,
          ),
          SizedBox(height: 20),

          // Themed text style for question number
          Text(
            'Question ${currentQuestionIndex + 1} of ${questions.length}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20),

          // Themed text style for main question
          Text(
            questions[currentQuestionIndex]['question'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 30),

          // Themed buttons for answer options
          ...questions[currentQuestionIndex]['options'].map<Widget>((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => checkAnswer(option),
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }







  Widget buildResultScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Your Score: $score/${questions.length}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                isQuizCompleted = false;
              });
            },
            child: Text('Restart Quiz'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
