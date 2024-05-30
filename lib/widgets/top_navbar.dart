import 'package:flutter/material.dart';

class Material3AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading; // Optional leading widget (e.g., app icon)
  final VoidCallback? onChatPressed;
  final VoidCallback? onSearchPressed;

  const Material3AppBar({
    Key? key,
    required this.title,
    this.leading,
    this.onChatPressed,
    this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary, // Use primary color
          fontSize: 20.0, // Adjust font size as needed
          fontWeight: FontWeight.w500, // Medium weight for Material 3
        ),
      ),
      leading: leading,
      actions: [
        IconButton(
          onPressed: onChatPressed,
          icon: Icon(
            Icons.chat,
            color: Theme.of(context).colorScheme.onPrimary, // Use onPrimary
          ),
        ),
        IconButton(
          onPressed: onSearchPressed,
          icon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary, // Use onPrimary
          ),
        ),
      ],
      // Set background color explicitly for Material 3 style
      backgroundColor: Color.fromARGB(255, 35, 155, 24),
      // Consider adding elevation or a shadow for depth
      elevation: 2.0, // Adjust elevation as desired
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
