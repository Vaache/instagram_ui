// lib/widgets/custom_app_bar.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        'Instagram',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.w400,
          fontFamily: 'HelloValentina',
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            log('Heart icon pressed');
          },
          icon: SvgPicture.asset(
            'assets/icons/heart.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
        ),
        IconButton(
          onPressed: () {
            log('Messenger icon pressed');
          },
          icon: SvgPicture.asset(
            'assets/icons/messenger.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }
}
