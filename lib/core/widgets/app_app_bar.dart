import 'package:anime_app/core/widgets/app_bar_action_text_button.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: Row(
        children: [
          const SizedBox(width: 16),
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset("assets/icons/logo.png"),
          ),
        ],
      ),
      actions: const [
        AppBarActionTextButton(
          text: "Animes",
        ),
        AppBarActionTextButton(
          text: "Mangas",
        ),
        AppBarActionTextButton(
          text: "Suggestions",
        ),
        SizedBox(width: 32),
      ],
    );
  }
}
