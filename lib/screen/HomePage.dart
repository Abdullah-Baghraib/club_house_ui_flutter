import 'package:clubhouse_ui_clone/const.dart';
import 'package:clubhouse_ui_clone/data.dart';
import 'package:clubhouse_ui_clone/widget/ProfileImage.dart';
import 'package:clubhouse_ui_clone/widget/Room_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        elevation: 0,
        leading: IconButton
        (
          onPressed: (){},
          icon: Icon(CupertinoIcons.search , color: Colors.black, size: 28,),
          
        ),

        actions: 
        [
          IconButton
          (
            onPressed: (){},
            icon: Icon(CupertinoIcons.envelope_open , color: Colors.black, size: 28,),
          
          ),
          IconButton
          (
            onPressed: (){},
            icon: Icon(CupertinoIcons.calendar , color: Colors.black, size: 28,),
          
          ),
          IconButton
          (
            onPressed: (){},
            icon: Icon(CupertinoIcons.bell , color: Colors.black, size: 28,),
          
          ),
          InkWell
          (
            onTap: () {
              
            },
            child: Padding(padding: EdgeInsets.fromLTRB(3, 10, 10, 10) ,child: ProfileImge(size: 34, imagesURL: currentUser.imageURL,))
          )
        ],
      ),
      
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView
          (
            padding: EdgeInsets.fromLTRB(10, 10, 10, 100),
            children: 
            [
              ...roomList.map((e) => RoomCard(room: e,))
            ],
          ),
          Positioned
          (
            bottom: 0,
            left: 0,
            right: 0,
            child: Container
            (
              height: 100,
              decoration: BoxDecoration
              (
                gradient: LinearGradient
                (
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: 
                  [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ]
                ),
              ),
            ),
          ),


          Positioned
          (
            bottom: 30,
            child: ElevatedButton.icon
            (
              onPressed: (){}, 
              icon:Icon( CupertinoIcons.add , size: 16,), 
              label: Text("Start a Room" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
              style: ElevatedButton.styleFrom
              (
                padding: EdgeInsets.all(15),
                primary: kAccsentColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
              ),
            ),
          )
        ],
      )
    );
  }
}