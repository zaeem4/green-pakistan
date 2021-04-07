import 'package:flutter/material.dart';
class BgImage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Image.network("https://images.unsplash.com/photo-1516617515776-750eafed616c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.5),
      colorBlendMode: BlendMode.darken,
    
    );
  }
}