import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/pages/detail/detail_page.dart';
import 'package:weather/pages/home/home.dart';

class BottomCustom extends StatefulWidget {
  const BottomCustom({super.key});

  @override
  State<BottomCustom> createState() => _BottomCustomState();
}

class _BottomCustomState extends State<BottomCustom> {
  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'List'),
  ];
  final List<Widget> listPages = [
    const HomePage(),
    const DetailPage(),
  ];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listPages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        elevation: 0,
        backgroundColor: Colors.white12,
        items: items,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
