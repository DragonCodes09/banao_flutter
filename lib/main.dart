import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tt/screen/main_page.dart';
import 'package:http/http.dart' as H;

Map<String, dynamic> mapResponse1 = {};
List listResponse1 = [];
Map<String, dynamic> mapResponse2 = {};
List listResponse2 = [];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    fetchingDataFromAPI_1();
    fetchingDataFromAPI_2();
  }

  Future<void> fetchingDataFromAPI_1() async {
    try {
      H.Response res = await H.get(Uri.parse(
          'https://632017e19f82827dcf24a655.mockapi.io/api/programs'));
      if (res.statusCode == 200) {
        setState(() {
          mapResponse1 = json.decode(res.body);
          listResponse1 = mapResponse1['items'];
          print('Done');
        });
      } else {
        print("Retrieving Failed");
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> fetchingDataFromAPI_2() async {
    try {
      H.Response res = await H.get(
          Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));
      if (res.statusCode == 200) {
        setState(() {
          mapResponse2 = json.decode(res.body);
          listResponse2 = mapResponse2['items'];
          print('Done');
        });
      } else {
        print("Retrieving Failed");
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'CustomFont',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            FirstPage(),
            Text("Second"),
            Text("Third"),
            Text("Fourth"),
            Text("Fifth"),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: _page == 0 ? Colors.blueAccent : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
              color: _page == 1 ? Colors.blueAccent : Colors.grey,
            ),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.window_outlined,
              color: _page == 2 ? Colors.blueAccent : Colors.grey,
            ),
            label: 'Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: _page == 3 ? Colors.blueAccent : Colors.grey,
            ),
            label: 'Chat',
          ),
          const BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://ynet-pic1.yit.co.il/picserver5/wcm_upload/2023/02/16/H1ueKos6j/shutterstock_2213684645.jpg"),
            ),
            label: 'Profile',
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
