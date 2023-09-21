import 'dart:math';

import 'package:clubhouse_ui_clone/Models/rooms.dart';
import 'package:clubhouse_ui_clone/const.dart';
import 'package:clubhouse_ui_clone/data.dart';
import 'package:clubhouse_ui_clone/widget/ProfileImage.dart';
import 'package:clubhouse_ui_clone/widget/RoomProfileImge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RoomPage extends StatelessWidget {

  final Room room;

  const RoomPage
  (
    {
      super.key, required this.room
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        elevation: 0,
        leadingWidth: 115,
        leading: TextButton.icon
        (
          style: TextButton.styleFrom
          (
            primary: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(CupertinoIcons.chevron_down , color: Colors.black, ),
          label: Text("Hallway" , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
          
        ),

        actions: 
        [
        
          IconButton
          (
            onPressed: (){},
            icon: Icon(CupertinoIcons.doc , color: Colors.black, size: 30,),
          
          ),
          InkWell
          (
            onTap: () {
              
            },
            child: Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10) ,child: ProfileImge(size: 34, imagesURL: currentUser.imageURL,))
          )
        ],
      ),

      body: Container
      (
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration
        (
          color: Colors.white,
          borderRadius: BorderRadius.circular(40)
        ),
        child: CustomScrollView
        (
          slivers: 
          [
            SliverToBoxAdapter
            (
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Icon(CupertinoIcons.ellipsis , color: Colors.black, size: 15,),
                    ],
                  ), 
                  SizedBox(height: 10,),
                  Text(room.name, 
                    style: Theme.of(context).textTheme.bodyText2!.copyWith
                    (
                      
                      fontSize:15,
                      fontWeight: FontWeight.bold,
                    ) ,
                    ),

                  
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: SliverGrid.count
                    (
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      children: room.speakers.map((e) => Room_User_Profile
                      (
                        imgURL: e.imageURL, 
                        name: e.firstName,
                        size: 66,
                        isNew: Random().nextBool(),
                        isMuted: Random().nextBool(),
                      )).toList(),
                    ),
            ), 

            SliverToBoxAdapter
            (
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  SizedBox(height: 30,),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [
                      Text("Followed By Speakers" , 
                    style: Theme.of(context).textTheme.overline!.copyWith
                    (
                      fontSize:16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ) ,
                    ),
                  SizedBox(height: 30,),
                    ],
                  ), 
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: SliverGrid.count
                    (
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                      children: room.followedBySpeakers.map((e) => Room_User_Profile
                      (
                        imgURL: e.imageURL, 
                        name: e.firstName,
                        size: 66,
                        isNew: Random().nextBool(),
                      )).toList(),
                    ),
            ), 



            SliverToBoxAdapter
            (
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  SizedBox(height: 30,),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [
                      Text("Others" , 
                    style: Theme.of(context).textTheme.overline!.copyWith
                    (
                      fontSize:16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ) ,
                    ),
                  SizedBox(height: 30,),

                    ],
                  ), 
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(15),
              sliver: SliverGrid.count
                    (
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                      children: room.others.map((e) => Room_User_Profile
                      (
                        imgURL: e.imageURL, 
                        name: e.firstName,
                        size: 66,
                        isNew: Random().nextBool(),
                      )).toList(),
                    ),
            ), 
            SliverPadding(padding: EdgeInsets.only(bottom: 60))
          ],
        ),
      ),
      bottomSheet: Container
      (
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        height: 90,
        child: Row
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: 
          [
            GestureDetector
            (
              onTap: () {
                
              },
              child: TextButton.icon(
                onPressed: () {}, 
                icon: Icon(CupertinoIcons.back , color:Colors.red , size: 19 ,), 
                label: Text("Leave Quitly" , style: TextStyle(color: Colors.red , fontSize: 15 , fontWeight: FontWeight.w500),),
                style: TextButton.styleFrom
                (
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.grey[300],
                ),
                ),
            ),
              

            Row
            (
              children: 
              [
                GestureDetector
                (
                  onTap: () {
                    
                  },
                  child: Container
                  (
                    decoration: BoxDecoration
                    (
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(12),
                    child: Icon(CupertinoIcons.add , size: 25 ,),
                  ),
                ),
                SizedBox(width: 14,),
                GestureDetector
                (
                  onTap: () {
                    
                  },
                  child: Container
                  (
                    decoration: BoxDecoration
                    (
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(12),
                    child: Icon(CupertinoIcons.hand_raised , size: 25 ,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      
    );
  }
}