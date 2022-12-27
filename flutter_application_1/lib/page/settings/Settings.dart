import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../dimonApp/Style.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 247, 252, 30),
      appBar: AppBar(
        title:  Text(" ڕێکخستن"),
        backgroundColor:const  Color.fromARGB(230, 100, 95, 189),
      ),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Card(
             color: ColorStyle,
             child: Container(
            height: HeightStyle,
            width: WidthStyle,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(UniconsLine.user_arrows,size: IconStyle,color: IconsStyle,),
                    Text(" کەسەکان",style: TextStyleCard,),
                  ],
                ),
              ),
            ),
          ),
        ),
        Card(
          color: ColorStyle,
          child: Container(
            height: HeightStyle,
            width: WidthStyle,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(UniconsLine.credit_card_search,size: IconStyle,color: IconsStyle,),
                    Text(" خەرجی و داهات",style: TextStyleCard,textAlign: TextAlign.end,),
                  ],
                ),
              ),
            ),
          ),
        )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: ColorStyle,
                  child: Container(
                    height: HeightStyle,
                    width: WidthStyle,
                    child:Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(UniconsLine.tag_alt,size: IconStyle,color: IconsStyle,),
                            Text("  تاگ ",style: TextStyleCard,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.black,
                  color: ColorStyle,
                  child: Container(
                    height: HeightStyle,
                    width: WidthStyle,
                    child:Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(UniconsLine.box,size: IconStyle,color: IconsStyle,),
                            Text("  سندوق",style: TextStyleCard),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(UniconsLine.home),
            title: const Text("داشبورد"),
            selectedColor: Colors.blue,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(UniconsLine.chart_line),
            title: const Text("ڕاپۆرتەکان"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(UniconsLine.users_alt),
            title: const Text("کەسەکان"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("..."),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
