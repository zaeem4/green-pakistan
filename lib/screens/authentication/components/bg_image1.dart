import 'package:flutter/material.dart';
class BgImage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Image.network("https://images.pexels.com/photos/1319750/pexels-photo-1319750.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.5),
      colorBlendMode: BlendMode.darken,
    
    );
  }
}