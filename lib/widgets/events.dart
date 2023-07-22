import 'package:flutter/material.dart';

class EventCard extends StatelessWidget{
  final String pictureName;
  final String title;
  final String description;
  final int time;
  const EventCard({super.key, required this.pictureName, required this.title, required this.description, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 1,
                  color: Colors.grey.shade300
              )
            ]
        ),
        // height: MediaQuery.of(context).size.height*0.4,
        height: 280,
        width: 242,
        // width: MediaQuery.of(context).size.width*0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(pictureName,fit: BoxFit.fill,alignment: Alignment.center,),
            Padding(
              padding: const EdgeInsets.only(left: 8,top: 16,bottom: 8),
              child: Text(title,style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
              child: Text(description,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text("$time Feb,Sunday",style: TextStyle(fontSize: 14,color: Colors.grey),),
                  Expanded(child: Container()),
                  Container(
                    height: 24,
                    width: 62,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent,width: 1),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(child: Text("Book",style: TextStyle(color: Colors.blueAccent),)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}