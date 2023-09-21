import 'package:flutter/material.dart';
import 'package:clubhouse_ui_clone/data.dart';

class ProfileImge extends StatelessWidget {

  final String imagesURL ;
  final double  size;

  const ProfileImge
  (
    {
    Key? key,
    required this.imagesURL,
    required this.size,
  }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect
          (
            borderRadius: BorderRadius.circular(size/2 - size/10),
            child: Image.network(imagesURL , width: size , height: size, fit: BoxFit.cover,)
          );
  }
}
