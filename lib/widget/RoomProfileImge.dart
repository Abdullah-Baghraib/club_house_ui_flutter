
import 'package:clubhouse_ui_clone/data.dart';
import 'package:clubhouse_ui_clone/widget/ProfileImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Room_User_Profile extends StatelessWidget {
  
  final String imgURL ;
  final String name;
  final double size;
  final bool isNew;  
  final bool isMuted;

  const Room_User_Profile
  (
    {
      super.key, 
      required this.imgURL, 
      required this.name, 
      this.size = 42, 
      this.isNew =false, 
      this.isMuted = false ,
    }
  );  

  @override
  Widget build(BuildContext context) {
    return Column
      (
        children: 
        [
          Stack
          (
            children:
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column
                (
                  children: 
                  [
                    ProfileImge(imagesURL: imgURL, size: size)
                  ],
                ),
              ),
              if(isNew)
              Positioned
              (
                left: 0,
                bottom: 0,
                child: Container
                (
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration
                  (
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black26 , offset: Offset(0, 2 ) , blurRadius: 4)
                    ]
                  ),
                  child: Icon(Icons.add_reaction_outlined),
                ),
              ),


              if(isMuted)
              Positioned
              (
                right: 0,
                bottom: 0,
                child: Container
                (
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration
                  (
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black26 , offset: Offset(0, 2 ) , blurRadius: 4)
                    ]
                  ),
                  child: Icon(CupertinoIcons.mic_slash_fill),
                ),
              ),

            ],
          ),
          Flexible(child: Text(name , overflow: TextOverflow.ellipsis,))
        ],
      );
  }
}