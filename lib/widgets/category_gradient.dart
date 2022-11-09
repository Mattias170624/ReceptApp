// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CategoryGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.3,
            0.6,
          ],
          colors: [
            Theme.of(context).colorScheme.onPrimary,
            Colors.white.withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}
