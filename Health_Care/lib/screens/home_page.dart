//import 'package:fittech_app/Widgets/appbar.dart';
import 'package:fittech_app/Widgets/appbar.dart';
import 'package:fittech_app/Widgets/drawer.dart';
import 'package:fittech_app/screens/add_post_page.dart';
import 'package:fittech_app/screens/post_page.dart';
import 'package:fittech_app/screens/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "/routehomepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [
    const PostPage(),
    const SearchPage(),
    const AddPostPage(),
    const SearchPage(),
  ];
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBarCustom(
        image: "assets/image.jpg",
        name: "Ali Diab",
        scafold: _scaffold,
      ),
      body: screens[index],
      drawer: DrawerWidget(
        image: "assets/image.jpg",
        name: "Ali Daib",
        isSwitched: true,
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(seconds: 2),
        indicatorColor: Colors.teal[200],
        backgroundColor: Colors.teal,
        selectedIndex: index,
        onDestinationSelected: (index) {
          setState(() => this.index = index);
        },
        destinations: const [
          // 0 1 2 3
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "home",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box_rounded),
            label: "Add",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "settings",
          ),
        ],
      ),
    );
  }
}
