import 'package:clubhouse_ui_clone/Models/rooms.dart';
import 'package:clubhouse_ui_clone/screen/RoomPage.dart';
import 'package:clubhouse_ui_clone/widget/ProfileImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {

  final Room room;

  const RoomCard
  (
    {
      super.key, required this.room
    }
  );
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomPage(room: room,),
        ) ),
      
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Card
        (
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding
          (
            padding: EdgeInsets.all(20),
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                Row
                (
                  children: 
                  [
                    Text(room.club.toUpperCase() , 
                    style: Theme.of(context).textTheme.overline!.copyWith
                    (
                      fontSize:12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ) ,
                    ),
                    SizedBox(width: 5,),
                    Icon(CupertinoIcons.home , color: Colors.black, size: 15,),
                  ],
                ),
      
                SizedBox(height: 8,),
      
                Text(room.name, 
                    style: Theme.of(context).textTheme.bodyText2!.copyWith
                    (
                      
                      fontSize:15,
                      fontWeight: FontWeight.bold,
                    ) ,
                    ),
      
                SizedBox(height: 10,),
      
                    Row
                    (
                      children: 
                      [
                        Expanded
                        (
                          
                          child: Container(
                            height: 100,
                            child: Stack
                            (
                              children: 
                              [
                                ProfileImge
                                (
                                  imagesURL: room.speakers[0].imageURL, 
                                  size: 48
                                ),
                                Positioned
                                (
                                  top: 20,
                                  left: 25,
                                  child: ProfileImge
                                  (
                                    imagesURL: room.speakers[1].imageURL, 
                                    size: 48
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        
                        Expanded
                        (
                          flex: 2,
                          child: Container
                          (
                            child: Column
                            (
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: 
                              [
                                ...room.speakers.map((e) {
                                return Text("${e.firstName} ${e.lastName} ", 
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16) ,);
                                }),
                                SizedBox(height: 10,),
                                Text.rich
                                (
                                  TextSpan
                                  (
                                    children: 
                                    [
                                      TextSpan(
                                        text: "${room.speakers.length + room.others.length + room.followedBySpeakers.length}  ",
                                        style: TextStyle(color: Colors.grey)
                                      ),
                                      
                                      WidgetSpan(
                                        child:Icon(CupertinoIcons.person_2 , color: Colors.grey, size: 15,) 
                                        ),
                                      TextSpan(
                                        text: "   /  ${room.speakers.length }  ",
                                        style: TextStyle(color: Colors.grey)
                                      ),
                                      
                                      WidgetSpan(
                                        child:Icon(CupertinoIcons.bubble_left_fill , color: Colors.grey, size: 13,) 
                                        ),
                                    ]
                                  )
                                ),
                              ],
                            )
                          )
                        ),
                      ],
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}