import 'package:flutter/material.dart';
import 'package:tt/main.dart';

class ApiOneScreen extends StatefulWidget{
  const ApiOneScreen({super.key});

  @override
  State<ApiOneScreen> createState() => _ApiOneScreenState();
}

class _ApiOneScreenState extends State<ApiOneScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Programs"),
      ),
        body: mapResponse1['count']==null? Center(child: CircularProgressIndicator()):ListView.builder(itemBuilder: (context,index){
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: Card(
             elevation: 5,
             child: ListTile(
               leading: CircleAvatar(
                 backgroundColor: Colors.purple.shade200,
                 child: Text(listResponse1[index]['id']),
               ),
               title: Text(listResponse1[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'CustomFont'),),
               subtitle: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(listResponse1[index]['category']),
                   Text("Lessons : ${listResponse1[index]['lesson']}"),
                 ],
               ),
               trailing: Column(
                 children: [
                   Text("Updated on :",style: TextStyle(fontSize: 15),),
                   Text(listResponse1[index]['createdAt'],style: TextStyle(fontSize: 8),),
                 ],
               ),
             ),
           ),
         );
        },
        itemCount: mapResponse1['count'],
        ),
    );
  }
}
