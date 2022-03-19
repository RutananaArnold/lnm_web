import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {
  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          // it will take full width
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/peoplelnm.jpg"))),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            endDrawer: drawer(),
            key: scaffoldKey,
            body: Stack(
              children: [customDrawer()],
            ))
      ],
    );
  }

  Widget customDrawer() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(
            Icons.done_all_sharp,
            color: Colors.black,
            size: 40,
          ),
        ),
        Text(
          "LNM",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () => scaffoldKey.currentState.openEndDrawer(),
          icon: Icon(Icons.menu_rounded),
          color: Colors.white,
          iconSize: 50,
        ),
      ],
    );
  }

  Widget drawer() {
    final titles = [
      "HOME",
      "ABOUT US",
      "TERMS AND CONDITIONS",
      "CONTACT US",
    ];

    return Drawer(
      
      child: ListView(itemExtent: 50, children: [
        SizedBox(
          height: 200,
        ),
        InkWell(
          child: Text("Home"),
          onTap: () {},
        ),
        InkWell(
          child: Text("ABOUT US"),
          onTap: () {},
        ),
        InkWell(
          child: Text("TERMS AND CONDITIONS"),
          onTap: () {},
        ),
        InkWell(
          child: Text("CONTACT US"),
          onTap: () {},
        )
      ]),
    );
  }
}
