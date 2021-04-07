import 'package:flutter/material.dart';
class UsNavBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Image.asset(
      "assets/images/tulip_image_2.png",
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.7),
      colorBlendMode: BlendMode.darken,
    
    );
  }
}