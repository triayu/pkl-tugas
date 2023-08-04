import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prospect/screens/home_page/widget/contact.dart';
import 'package:prospect/screens/home_page/widget/dialog.dart';
import 'package:prospect/screens/home_page/widget/drawer.dart';
import 'package:prospect/screens/home_page/widget/event.dart';
import 'package:prospect/screens/home_page/widget/setting.dart';
import 'package:prospect/widget/custom_widget.dart';
import 'widget/dashboard_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();

  List<Widget> homePages = [
    Dashboard_view(),
    ContactView(),
    EventView(),
    SettingView()
  ];

  Widget activePage = Dashboard_view();
  String activeTittle = '';
  Icon activeIcon = Icon(Icons.home);
  int activeIndex = 0;

  List<Icon> icons = [
    Icon(Icons.home),
    Icon(Icons.contact_mail),
    Icon(Icons.event),
    Icon(Icons.settings)
  ];

  List<String> title = ['Home ', 'Contact', 'Events', 'Setting'];
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: widget.activePage,
          ),
        ),
        appBar: widget.activeIndex == 1 || widget.activeIndex == 2
            ? CustomAppBar(
                title: widget.activeTittle,
                canBack: false,
                backgroundColor: Colors.blue,
              )
            : null,
        drawer: WiDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              setState(() {
                widget.activePage = widget.homePages[0];
                widget.activeTittle = widget.title[0];
                widget.activeIcon = widget.icons[0];
                widget.activeIndex = 0;
              });
            }

            if (value == 1) {
              log('1');
              setState(() {
                widget.activePage = widget.homePages[1];
                widget.activeTittle = widget.title[1];
                widget.activeIcon = widget.icons[1];
                widget.activeIndex = 1;
              });
            }
            if (value == 2) {
              setState(() {
                widget.activePage = widget.homePages[2];
                widget.activeTittle = widget.title[2];
                widget.activeIcon = widget.icons[2];
                widget.activeIndex = 2;
              });
            }
            if (value == 3) {
              setState(() {
                widget.activePage = widget.homePages[3];
                widget.activeTittle = widget.title[3];
                widget.activeIcon = widget.icons[3];
                widget.activeIndex = 3;
              });
            }
          },
          elevation: 1,
          currentIndex: widget.activeIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black26,
          items: List.generate(
            4,
            (index) {
              log(index.toString());
              return BottomNavigationBarItem(
                  icon: widget.icons[index],
                  label: widget.title[index],
                  backgroundColor: Colors.white,
                  activeIcon: widget.icons[index]);
            },
          ),
        ),
        floatingActionButton: widget.activeIndex == 1
            ? FloatingActionButton(
                onPressed: () {
                  if (widget.activeIndex == 1) {
                    showDialog(
                        context: context,
                        builder: (val) {
                          return DialogView(
                            title: 'Test',
                          );
                        });
                  }
                },
                backgroundColor: Colors.blue,
                child: Icon(Icons.plus_one),
              )
            : Container());
  }
}

// class ButtomNavigationBarItem {}
