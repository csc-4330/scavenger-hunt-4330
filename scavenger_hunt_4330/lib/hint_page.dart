// screens/hint_page.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'hint_text_page.dart';

class HintPage extends StatefulWidget {
  final String difficulty;
  const HintPage({super.key, required this.difficulty});

  @override
  HintPageState createState() => HintPageState();
}

class HintPageState extends State<HintPage> {
  final List<String> imagePaths =
      List.generate(10, (index) => 'assets/image${index + 1}.jpg');

  final List<String> prompts = [
    "What in the binary number that is written on the left wall of the atrium?",
    "What is the room number for the BASF lab?",
    "How many purple sponsor banners are on the sponsor wall?",
    "How many wooden steps are there in the capstone stairs?",
    "What year was the Tau Beta Pi LSU chapter founded?",
    "What is the maximum occupancy at Panera Bread?",
    "What follows OTP- at the distillery on the second floor?",
    "What floor is Professor Shepherd's office on? (ex: 1st, 2nd, 3rd)",
    "What is the room number of the Computer Science office in PFT?",
    "What year did Patrick F. Taylor pass away?"
  ];

  final List<String> expectedAnswers = [
    '101010010', '1154', '9', '11', '1936',
    '88', 'DC15S', '3rd', '3325', '2004'
  ];

  // New list of unique messages for the hint text page
  final List<String> hintTextMessages = [
    "The atrium of LSU’s Patrick F. Taylor Hall was designed to create a spacious, open atmosphere with an emphasis on natural light. Large windows and skylights fill the space with light, promoting a collaborative and inviting environment. The modern design uses materials like concrete, glass, and steel to connect the indoors with the outdoors, reflecting the building's focus on innovation and connection.",
    "The BASF Lab in PFT is a research facility designed for students and faculty in the College of Engineering to conduct hands-on experiments and research in the field of chemical engineering. The lab is part of a partnership with BASF, a global chemical company, and is equipped with advanced technology and equipment to support research on chemical processes, sustainability, and other engineering innovations. It serves as a space for collaboration between university and industry, helping students gain practical experience.",
    "The sponsor wall in Patrick F. Taylor Hall recognizes the contributions of companies and organizations that support LSU’s engineering programs, with banners prominently displaying their names.",
    "The Capstone Stairs are an iconic part of the architectural design of the Patrick F. Taylor Hall, often serving as a striking feature that draws attention for both its functionality and aesthetic appeal.",
    "Tau Beta Pi is the national engineering honor society, and the LSU chapter has a long history of honoring high-achieving engineering students, promoting the values of scholarship and service.",
    "Panera Bread at LSU is a popular spot for students and faculty, offering a variety of delicious menu items. The commons outside provide an open space to enjoy food, unwind after class, or study with friends.",
    "The OTP- term refers to a unique part of LSU’s distillery research area, where students and faculty explore cutting-edge chemical engineering processes.",
    "Professor Shepherd’s office, located in the 3rd floor of the engineering building, is easily accessible to students. This is not to be confused with Daniel Shepherd's office, which is on the 2nd floor.",
    "The Computer Science office in Patrick F. Taylor Hall is a central point for students in the program, providing academic resources, advising, and information about the latest developments in the field.",
    "Patrick F. Taylor, a key figure in the development of LSU’s engineering school, was known for his generous contributions that helped shape the building and its programs into what they are today."
  ];

  int currentIndex = 0;
  final TextEditingController _controller = TextEditingController();
  bool isAnswerCorrect = false;
  Timer? _timer;
  int _timeLeft = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    if (widget.difficulty == "casual") {
      _timeLeft = 0;
      return;
    }
    _timeLeft = widget.difficulty == "hard" ? 60 : 300;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
        Navigator.pushReplacementNamed(context, '/lost');
      }
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  void showHintTextPage() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HintTextPage(
        hintTextMessage: hintTextMessages[currentIndex], // Pass the unique message
        imagePath: imagePaths[currentIndex], // ✅ Now passing the correct image!
        onContinue: nextPage,
      ),
    ),
  );
}


  void nextPage() {
  cancelTimer();
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HintTextPage(
        hintTextMessage: hintTextMessages[currentIndex], // ✅ Pass the unique hint message
        imagePath: imagePaths[currentIndex], // ✅ Pass the correct image path!
        onContinue: () {
          Navigator.pop(context); // Close hint page
          setState(() {
            if (currentIndex < imagePaths.length - 1) {
              currentIndex++;
              _controller.clear();
              isAnswerCorrect = false;
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          });
          startTimer();
        },
      ),
    ),
  );
}


  void _checkAnswer(String value) {
    if (value.trim().toLowerCase() ==
        expectedAnswers[currentIndex].toLowerCase()) {
      if (!isAnswerCorrect) {
        setState(() {
          isAnswerCorrect = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted &&
              _controller.text.trim().toLowerCase() ==
                  expectedAnswers[currentIndex].toLowerCase()) {
            nextPage();
          }
        });
      }
    } else {
      setState(() {
        isAnswerCorrect = false;
      });
    }
  }

  @override
  void dispose() {
    cancelTimer();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color timerBorderColor = Theme.of(context).colorScheme.secondary;
    double progressValue = (currentIndex + 1) / imagePaths.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scavenger Hunt'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              cancelTimer();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              cancelTimer();
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 4,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: progressValue),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF46166B)),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Image.asset(
                    imagePaths[currentIndex],
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30),
                  if (widget.difficulty != "casual")
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: timerBorderColor),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Time Left: $_timeLeft seconds',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  const SizedBox(height: 30),
                  Text(
                    prompts[currentIndex],
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _controller,
                    onChanged: _checkAnswer,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your answer here',
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
