import 'package:flutter/material.dart';
import 'package:tt/main.dart';

class ApiTwoScreen extends StatefulWidget {
  const ApiTwoScreen({super.key});

  @override
  State<ApiTwoScreen> createState() => _ApiTwoScreenState();
}

class _ApiTwoScreenState extends State<ApiTwoScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Lessons"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: mapResponse2['count'] == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple.shade200,
                        child: Text(listResponse2[index]['id']),
                      ),
                      title: Text(
                        listResponse2[index]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CustomFont'),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listResponse2[index]['category']),
                          Text(
                              "Duration : ${listResponse2[index]['duration']}"),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            "Updated on :",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            listResponse1[index]['createdAt'],
                            style: TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: mapResponse2['count'],
            ),
    );
  }
}
