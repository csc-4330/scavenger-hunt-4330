// import 'package:flutter/material.dart';
// import 'lsu_colors.dart';

// class HintPage extends StatefulWidget {
//   final String difficulty;
//   final int startIndex;
//   final List<bool> answered;
//   final void Function(int index) onAnswer;
//   final VoidCallback onBack;

//   const HintPage({
//     super.key,
//     required this.difficulty,
//     required this.startIndex,
//     required this.answered,
//     required this.onAnswer,
//     required this.onBack,
//   });

//   @override
//   State<HintPage> createState() => _HintPageState();
// }

// class _HintPageState extends State<HintPage> {
//   final List<String> imagePaths =
//       List.generate(10, (i) => 'assets/image${i + 1}.jpg');

//   final List<String> prompts = [
//     "What is the binary number on the left wall of the atrium?",
//     "What is the room number for the BASF lab?",
//     "How many purple sponsor banners are on the sponsor wall?",
//     "How many wooden steps are there in the capstone stairs?",
//     "What year was the Tau Beta Pi LSU chapter founded?",
//     "What is the maximum occupancy at Panera Bread?",
//     "What follows OTP- at the distillery on the second floor?",
//     "What floor is Professor Shepherd's office on?",
//     "What is the room number of the Computer Science office in PFT?",
//     "What year did Patrick F. Taylor pass away?"
//   ];

//   final List<String> expectedAnswers = [
//     '101010010', '1154', '9', '11', '1936',
//     '88', 'DC15S', '3rd', '3325', '2004'
//   ];

//   final List<String> locationInfo = [
//     "The atrium was designed to be bright and collaborative with open light-filled spaces.",
//     "The BASF lab supports chemical engineering experiments and student research.",
//     "The sponsor wall highlights companies that support LSU Engineering.",
//     "The Capstone Stairs are an architectural focal point of PFT Hall.",
//     "Tau Beta Pi is an engineering honor society, founded at LSU in 1936.",
//     "Panera Bread is a common student hangout spot with posted occupancy info.",
//     "The distillery houses advanced chemical engineering research equipment.",
//     "Prof. Shepherd's office is on the 3rd floor — don’t mix it up!",
//     "The CS office in PFT offers advising and departmental resources.",
//     "Patrick F. Taylor’s legacy lives on in the engineering program."
//   ];

//   int currentIndex = 0;
//   final TextEditingController _controller = TextEditingController();
//   bool showLocationInfo = false;
//   bool? submissionCorrect;

//   @override
//   void initState() {
//     super.initState();
//     currentIndex = widget.startIndex;
//     showLocationInfo = widget.answered[currentIndex];
//   }

//   void _submitAnswer() {
//     final input = _controller.text.trim().toLowerCase();
//     final correct = expectedAnswers[currentIndex].toLowerCase();

//     setState(() {
//       submissionCorrect = input == correct;
//       if (submissionCorrect == true) {
//         showLocationInfo = true;
//       }
//     });
//   }

//   void _nextQuestion() {
//     widget.onAnswer(currentIndex);

//     final next = widget.answered.indexOf(false);
//     if (next != -1 && next != currentIndex) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HintPage(
//             difficulty: widget.difficulty,
//             startIndex: next,
//             answered: widget.answered,
//             onAnswer: widget.onAnswer,
//             onBack: widget.onBack,
//           ),
//         ),
//       );
//     } else {
//       widget.onBack(); // All questions done, return to list
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double progress = (currentIndex + 1) / 10;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(showLocationInfo
//             ? "Location Info"
//             : "Question ${currentIndex + 1}"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: widget.onBack,
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Progress Bar
//             Column(
//               children: [
//                 Text(
//                   "Progress: Question ${currentIndex + 1} of 10",
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 LinearProgressIndicator(
//                   value: progress,
//                   backgroundColor: LSUColors.lightGray,
//                   color: LSUColors.purple,
//                   minHeight: 6,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),

//             Image.asset(
//               imagePaths[currentIndex],
//               width: double.infinity,
//               height: 300,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 24),

//             if (showLocationInfo)
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: LSUColors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: LSUColors.purple, width: 2),
//                 ),
//                 child: Text(
//                   locationInfo[currentIndex],
//                   style: const TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               )
//             else ...[
//               Text(
//                 prompts[currentIndex],
//                 style: const TextStyle(fontSize: 18),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _controller,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your answer here',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _submitAnswer,
//                 child: const Text("Submit"),
//               ),
//               const SizedBox(height: 12),
//               if (submissionCorrect == true)
//                 const Text(
//                   "Correct!",
//                   style: TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 )
//               else if (submissionCorrect == false)
//                 const Text(
//                   "Incorrect. Try again.",
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//             ],

//             const SizedBox(height: 24),

//             if (showLocationInfo)
//               ElevatedButton(
//                 onPressed: _nextQuestion,
//                 child: const Text("Next Question"),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
