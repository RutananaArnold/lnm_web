import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false];
  List _isSelected = [true, false, false, false, false];

  final List<String> images = [
    'assets/images/peoplelnm.jpg',
    'assets/images/moneyjag03.jpg',
    'assets/images/aaa.jpg',
    'assets/images/abb.jpg'
  ];

  final List<String> words = ['Welcome', 'Easy to Use', 'Reward', 'Satified'];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map((e) => Builder(builder: (context) {
              return Container(
                height: screenSize.height * 0.02,
                width: screenSize.width,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset(
                  e,
                  fit: BoxFit.cover,
                ),
              );
            }))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);
    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: true,
            viewportFraction: 1,
            // aspectRatio: 16 / 9,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            // autoPlayAnimationDuration: Duration(milliseconds: 400),
            ///  autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
                for (int i = 0; i < imageSliders.length; i++) {
                  if (i == index) {
                    _isSelected[i] = true;
                  } else {
                    _isSelected[i] = false;
                  }
                }
              });
            },
          ),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 11,
          child: Center(
              child: Text(
            words[currentIndex],
            style: TextStyle(
                letterSpacing: 8,
                fontSize: screenSize.width / 25,
                fontFamily: 'Electrolize',
                color: Colors.blue),
          )),
        ),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            heightFactor: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width / 8,
                  right: screenSize.width / 8,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height / 50,
                      bottom: screenSize.height / 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < words.length; i++)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onHover: (value) {
                                  setState(() {
                                    value
                                        ? _isHovering[i] = true
                                        : _isHovering[i] = false;
                                  });
                                },
                                onTap: () {
                                  _controller.animateToPage(i);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: screenSize.height / 80,
                                      bottom: screenSize.height / 90),
                                  child: Text(
                                    words[i],
                                    style: TextStyle(
                                      color: _isHovering[i]
                                          ? Colors.blueGrey[900]
                                          : Colors.blueGrey,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: _isSelected[i],
                                  child: AnimatedOpacity(
                                    opacity: _isSelected[i] ? 1 : 0,
                                    duration: Duration(milliseconds: 400),
                                    child: Container(
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      width: screenSize.width / 10,
                                    ),
                                  ))
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
