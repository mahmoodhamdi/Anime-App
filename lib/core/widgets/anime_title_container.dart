import 'package:flutter/material.dart';

class AnimeTitleContainer extends StatelessWidget {
  const AnimeTitleContainer({super.key, required this.animeTitle});
  final String animeTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 120,
          padding: const EdgeInsets.all(40),
          decoration: ShapeDecoration(
            color: const Color(0xCC20283E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Center(
            child: Text(
              animeTitle,
              style: const TextStyle(
                color: Color(0xFFEBEEF5),
                fontSize: 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0.04,
                letterSpacing: -0.64,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
