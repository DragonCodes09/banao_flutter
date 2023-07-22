
import 'package:flutter/material.dart';
import 'package:tt/widgets/events.dart';
import 'package:tt/widgets/lessons.dart';
import 'package:tt/widgets/programs.dart';
import 'package:tt/widgets/type.dart';

class FirstPage extends StatelessWidget{
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238,243,253),
        leading: Icon(Icons.menu,color: Colors.grey,),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon:Icon(Icons.chat_bubble_outline,color: Colors.grey,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.notifications_none_outlined,size: 28,color: Colors.grey,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 238,243,253),
              height: MediaQuery.of(context).size.height*0.34,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text('Hello, Priya',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500,fontFamily: 'CustomFont'),),
                      Text('What do you wanna learn today?',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 24,),
                    Column(
                      children: [
                        Row(
                          children: [
                            TypesIcons(iconData: Icons.book, tt: "Programs", colour: Colors.blueAccent, bgColour: Colors.white),
                            TypesIcons(iconData: Icons.help, tt: "Get Help", colour: Colors.blueAccent, bgColour: Colors.white),
                          ],
                        ),
                        // SizedBox(height: ,),
                        Row(
                          children: [
                            TypesIcons(iconData: Icons.menu_book, tt: "Learn", colour: Colors.blueAccent, bgColour: Colors.white),
                            TypesIcons(iconData: Icons.poll, tt: "DD Traker", colour: Colors.blueAccent, bgColour: Colors.white),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                children: [
                  Text('Programs for you',style: TextStyle(fontSize: 20,fontFamily: "CustomFont"),),
                  Expanded(child: Container()),
                  Text('View all',style: TextStyle(color: Colors.grey),),
                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.arrow_forward,color: Colors.grey,))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProgramCard(pictureName: "assets/A.png", title: "LIFESTYLE", description: "A complete guide for your new born baby", time: 16),
                  ProgramCard(pictureName: "assets/A.png", title: "WORKING PARENTS", description: "Understanding of human behaviour", time: 12)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                children: [
                  Text('Events and experiences',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "CustomFont"),),
                  Expanded(child: Container()),
                  Text('View all',style: TextStyle(color: Colors.grey),),
                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.arrow_forward,color: Colors.grey,))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  EventCard(pictureName: "assets/C.png", title: "BABYCARE", description: "Understanding of human behaviour", time: 16),
                  EventCard(pictureName: "assets/C.png", title: "BABYCARE", description: "Understanding of human behaviour", time: 16),
                ],
              ),
            ),Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                children: [
                  Text('Lessons for you',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: "CustomFont"),),
                  Expanded(child: Container()),
                  Text('View all',style: TextStyle(color: Colors.grey),),
                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.arrow_forward,color: Colors.grey,))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  LessonCard(pictureName: "assets/C.png", title: "BABYCARE", description: "Understanding of human behaviour", time: 16),
                  LessonCard(pictureName: "assets/C.png", title: "BABYCARE", description: "Understanding of human behaviour", time: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}