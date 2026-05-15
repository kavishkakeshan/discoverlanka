import 'package:flutter/material.dart';

class UserProfileComponents extends StatelessWidget {
  final String textString;
  final IconData iconData;
  final VoidCallback? onTap;
  final Color backgroundColor;
  const UserProfileComponents({
    super.key,
    required this.textString,
    required this.iconData,
    this.onTap,
    this.backgroundColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 5, 63, 5),
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Text(
              textString,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }
}