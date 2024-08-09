import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeCoverContainer extends StatelessWidget {
  const AnimeCoverContainer({super.key, required this.coverImageUrl});
  final String coverImageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1200,
          height: 480,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(coverImageUrl),
              onError: (_, __) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            gradient: const LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF362C92), Color(0xFF116197)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ],
    );
  }
}
