// import 'package:flutter/material.dart';
// import 'package:quizapp/utility/routes.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(children: [
//         Container(
//           height: MediaQuery.of(context).size.height,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/images/puzzle.jpg"),
//                   fit: BoxFit.fill)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.70,
//               ),
//               const Text(
//                 "Let's play...",
//                 style: TextStyle(
//                     fontSize: 40,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontStyle: FontStyle.italic,
//                     //  decoration: TextDecoration.none,
//                     shadows: [
//                       Shadow(
//                           blurRadius: 10,
//                           color: Colors.redAccent,
//                           offset: Offset(3, 3))
//                     ]),
//                 textAlign: TextAlign.start,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.03,
//               ),
//               Container(
//                 height: 40,
//                 width: 100,
//                 color: Colors.white70,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, Routes.questionscreen);
//                   },
//                   child: const Text(
//                     "START",
//                     style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 20),
                    
//                   ),
//                 ),
//               ),
//              // questionWidget(),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }

// // questionWidget(){
// //   return Column(


// //   );
// // }



// }
import 'package:flutter/material.dart';
import 'package:quizapp/utility/routes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/puzzle.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                      Container(
                    height: 40,
                    width: 150,
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.adminscreen);
                      },
                      child: const Text(
                        "ADMIN PAGE",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  ],),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.70,
                ),
                const Text(
                  "Let's play...",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.redAccent,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  height: 40,
                  width: 100,
                  color: Colors.white70,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.questionscreen);
                    },
                    child: const Text(
                      "START",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
