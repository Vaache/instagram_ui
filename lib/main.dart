import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(ScreenWidget());

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MaterialApp(
        home: HomeScreen(),
        routes: {
          '/stories': (context) {
            final index =
                (ModalRoute.of(context)?.settings.arguments as List<int>)[0];
            final storyCount =
                (ModalRoute.of(context)?.settings.arguments as List<int>)[1];
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.black,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                    color: Colors.white,
                  ),
                ],
              ),
              body: LayoutBuilder(builder: (context, constraints) {
                final screenWitdh = constraints.maxWidth;

                return GestureDetector(
                  child: Image.asset('assets/images/story_$index.jpg'),
                  onTapDown: (details) {
                    if (details.localPosition.dx < screenWitdh / 2) {
                      if (index == 1) {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context).pushReplacementNamed('/stories',
                            arguments: [index - 1, storyCount]);
                      }
                    } else {
                      if (index == storyCount) {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context).pushReplacementNamed('/stories',
                            arguments: [index + 1, storyCount]);
                      }
                    }
                  },
                );
              }),
            );
          }
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class SplitTapWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Split Tap Example'),
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           // Получаем ширину экрана
//           double screenWidth = constraints.maxWidth;

//           return GestureDetector(
//             onTapDown: (details) {
//               // Определяем, где было касание
//               if (details.localPosition.dx < screenWidth / 2) {
//                 // Левая половина
//                 print('Left side tapped');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Left side tapped')),
//                 );
//               } else {
//                 // Правая половина
//                 print('Right side tapped');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Right side tapped')),
//                 );
//               }
//             },
//             child: Container(
//               color: Colors.blueAccent,
//               child: Center(
//                 child: Text(
//                   'Tap on left or right side',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: SplitTapWidget(),
//   ));
// }
