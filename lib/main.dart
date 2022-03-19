import 'package:flutter/material.dart';
import 'package:lnm_web/responsive.dart';
import 'package:lnm_web/screens/home.dart';
import 'package:lnm_web/screens/mobview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finda',
      // theme: ThemeData(
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: Index(),
    );
  }
}

class Index extends StatefulWidget {
  const Index({Key key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int pageIndex = 0;
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //this size provides the total height and width of the screen
    return 
    ResponsiveWidget.isMobileScreen(context)
        ? MobileScreen()
        : Stack(
            children: [
              // Image Code
              Container(
                height: size.height,
                // it will take full width
                width: size.width,
                color: Colors.grey,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: AssetImage("assets/images/sky.jpg"))),
              ),

              Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    // Body
                    PageView(
                      controller: pageController,
                      onPageChanged: (currentPageIndex) {
                        setState(() {
                          pageIndex = currentPageIndex;
                        });
                      },
                      children: [
// Put Widgets Here
// Home
                        Home(),

// About
                        Container(),

// Terms
                        Container(),

// Contact Us
                        Container(),
                      ],
                    ),

// // AppBar

                    CustomAppBar(
                      pageController: pageController,
                      currentPageIndex: pageIndex,
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

// AppBar
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    this.pageController,
    this.currentPageIndex,
  }) : super(key: key);

  final PageController pageController;
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    final titles = [
      "HOME",
      "SUBMIT LOST ITEM",
      "SUBMIT FOUND ITEM",
      "VIEW RECENT POSTS",
    ];

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(35),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(47),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -2),
                  blurRadius: 30,
                  color: Colors.black.withOpacity(0.16))
            ]),
        height: kToolbarHeight,
        child: Row(
          children: [
// Icon
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/lnm.png"),
                  ),
                ),
              ],
            ),
// Others
            const Spacer(),

            ...List.generate(
              titles.length,
              (index) {
                final title = titles[index];
// If current index is the same as the tapped index then underline
                final isCurrentSelection = (index == currentPageIndex);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Text(title),
                        onTap: () {
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.linear,
                          );
                        },
                      ),
                      if (isCurrentSelection)
                        Container(
                          height: 3,
                          width: 60,
                          margin: const EdgeInsets.all(4),
                          color: Colors.black,
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// https://blog.codemagic.io/flutter-web-getting-started-with-responsive-design/
