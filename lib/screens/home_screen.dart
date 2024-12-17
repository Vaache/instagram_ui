import 'package:flutter/material.dart';
import 'package:my_app/widgets/comments.dart';
import 'package:my_app/widgets/custom_app_bar.dart';
import 'package:my_app/widgets/stories_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          StoriesList(),
          // Expanded(child: CommentScreen()),
        ],
      ),
    );
  }
}
