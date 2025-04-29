import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thai_hotline_app/views/about_ui.dart';
import 'package:thai_hotline_app/views/sub_a_home_ui.dart';
import 'package:thai_hotline_app/views/sub_b_home_ui.dart';
import 'package:thai_hotline_app/views/sub_c_home_ui.dart';
import 'package:thai_hotline_app/views/sub_d_home_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;
  //? เอาไว้เก็บ widget ที่จะแสดงใน body
  List<Widget> viewInBody = [
    SubAHomeUI(),
    SubBHomeUI(),
    SubCHomeUI(),
    SubDHomeUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('สายด่วน THAILAND', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          //? แสดง icon ไปยังหน้า about
          IconButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUI()),
                ),
            icon: Icon(FontAwesomeIcons.circleInfo, color: Colors.white),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.amber),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.carOn),
              label: 'Travel',
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              icon: Icon(FontAwesomeIcons.warning),
              label: 'Emergency',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dollarSign),
              label: 'Bank',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.water_drop_outlined),
              label: 'Utility',
            ),
          ],
        ),
      ),
      body: viewInBody[_selectedIndex],
    );
  }
}
