import 'package:flutter/material.dart';
import 'package:lnm_web/components/bottom_bar.dart';


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(15, 10, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Welcome to Finda....",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Intelligent Lost & Found Online Mechanism",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Finda is an entirely new intelligent lost and found matching system. We have taken a different approach than the traditional lost & founds  by creating a multi-level platform for businesses and individuals to submit lost or found items into our matching system. Once the lost or found items are submitted and placed into our matching system, we intelligently help to find and locate the misplaced goods and who has them.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 40.0),
                    child: Text(
                      "Submit Lost Item",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 40.0),
                    child: Text(
                      "Submit Found Item",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.asset(
          "assets/images/lost_found.png",
          width: width,
        ),
      ),
    ];
  }

  List<Widget> pageChildren2(double width) {
    return <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(15, 10, 2, 0),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Are you a Business Owner or Manager",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: InkWell(
                  child: Text(
                    "Signup for our Lost & Found Management System",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 15.0,
                      color: Colors.blue,
                    ),
                  ),
                  onTap: () {},
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Intelligent Lost & Found Matching System",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Losing or misplacing your property can be frustrating and become such a hassle to find. At Finda, we answer all that by providing an intelligent lost and found matching system, which automatically identifies, matches, and pairs recently lost or found items with one another.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "We’ve also partnered with local and regional businesses to submit found items into our matching system. This helps to maximize reach and gives users a higher rate of success when attempting to locate and find lost property..",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20.0),
      //   child:
      Image.asset(
        "assets/images/intel.png",
        width: width,
      ),
      //  ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: 95,
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 10),
                Container(
                  color: Colors.white.withOpacity(0.6),
                  width: size.width,
                  height: size.height * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pageChildren(
                      size.width / 2,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.6),
                  width: size.width,
                  height: size.height * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pageChildren2(
                      size.width / 2,
                    ),
                  ),
                ),

                 BottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
