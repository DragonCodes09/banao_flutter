import 'package:flutter/material.dart';
import 'package:tt/screen/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const MyHomePage(title: "Assignment",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 1;
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
  void onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(
      // backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        // selectedLabelStyle: TextStyle(fontSize: 8,color: Colors.blueAccent),
        // unselectedLabelStyle: TextStyle(fontSize: 12,color: Colors.grey),
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
              backgroundImage: NetworkImage("https://ynet-pic1.yit.co.il/picserver5/wcm_upload/2023/02/16/H1ueKos6j/shutterstock_2213684645.jpg"),
            ),
            label: 'Profile',
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
