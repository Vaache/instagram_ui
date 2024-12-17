// lib/widgets/stories_list.dart

import 'package:flutter/material.dart';

class StoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storyCount = 10;
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyCount, // Это количество историй, измените как нужно
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage:
                      AssetImage('assets/images/story_${index + 1}.jpg'),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/stories', arguments: [index + 1, storyCount]);
                },
              ));
        },
      ),
    );
  }
}
