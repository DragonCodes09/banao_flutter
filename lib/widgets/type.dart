import 'package:flutter/material.dart';
class TypesIcons extends StatelessWidget{
  final IconData iconData;
  final String tt;
  final Color colour;
  final Color bgColour;
  const TypesIcons( {super.key,required this.iconData,required this.tt, required this.colour, required this.bgColour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width*0.43,
        decoration: BoxDecoration(
            color: bgColour,
            border: Border.all(
              width: 1,
              color: Colors.blueAccent,
            ),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData,size: 24,color: colour,),
                const SizedBox(height: 5,width: 10,),
                Text(tt,style: TextStyle(color: colour,fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),
          ),
        ),
      ),
    );
  }

}