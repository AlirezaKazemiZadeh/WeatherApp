import 'package:flutter/material.dart';
import 'package:flutter_application_1/UserInterface/history.dart';
import 'package:flutter_application_1/UserInterface/home_page.dart';
import 'package:flutter_application_1/UserInterface/testpage.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'constants.dart';

class HiddenDrawer extends StatelessWidget {
  final Constants _constants = Constants();
  final List<ScreenHiddenDrawer> itemList = [
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "MAIN PAGE",
        colorLineSelected: Colors.lightBlueAccent,
        baseStyle: mytextstyle,
        selectedStyle: const TextStyle(color: Colors.white),
      ),
      const HomePage(),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "HISTORY",
        colorLineSelected: Colors.lightBlueAccent,
        baseStyle: mytextstyle,
        selectedStyle: const TextStyle(color: Colors.white),
      ),
      const HistoryPage(),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "CONTACT US",
        colorLineSelected: Colors.lightBlueAccent,
        baseStyle: mytextstyle,
        selectedStyle: const TextStyle(color: Colors.white),
      ),
      const ContactPage(),
    ),
  ];

  HiddenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: itemList,
      backgroundColorMenu: _constants.primaryColor,
      slidePercent: 40,
      //  typeOpen: TypeOpen.FROM_RIGHT,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      verticalScalePercent: 80.0,
      contentCornerRadius: 20,
      //    iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      // withAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //backgroundColorContent: const Color.fromARGB(0, 0, 0, 0),
      //backgroundColorAppBar: const Color.fromARGB(0, 231, 237, 241),
      elevationAppBar: 0.0,
      tittleAppBar: const Center(
        child: Icon(Icons.ac_unit),
      ),
      enableShadowItensMenu: false,
      backgroundMenu: const DecorationImage(
          image: ExactAssetImage('assets/background2.png'), fit: BoxFit.cover),
      // withShadow: true,
      // boxShadow: [
      //   BoxShadow(
      //     color: _constants.tertiaryColor,
      //     offset: const Offset(-10.0, 20.0),
      //     blurRadius: 50,
      //     spreadRadius: 5.0,
      //   ),
      // ],
      disableAppBarDefault: true,
      //  isDraggable: true,
    );
  }
}

final mytextstyle = TextStyle(
  color: Colors.white.withOpacity(0.8),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
