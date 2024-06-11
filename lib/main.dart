import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpeg'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.bottomCenter, colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.3),
              ])),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeItem(image: 'assets/images/place1.jpg'),
                          makeItem(image: 'assets/images/place2.jpg'),
                          makeItem(image: 'assets/images/place3.jpg'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          makePoint(top: 140.0, left: 40.0),
          makePoint(top: 190.0, left: 190.0),
          makePoint(top: 219.0, left: 60.0),
        ],
      ),
    );
  }

  Widget makePoint({top, left}) {
    return Positioned(
        top: top,
        left: left,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow.withOpacity(0.3),
          ),
          child: Animator<double>(
            duration: const Duration(seconds: 1),
            tween: Tween(begin: 4.0, end: 6.0),
            cycles: 0,
            builder: (context, anim, child) => Center(
              child: Container(
                margin: EdgeInsets.all(anim.value),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ));
  }

  Widget makeItem({image}) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/place1.jpg"),
                          fit: BoxFit.contain)),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200]),
                  child: Text(
                    '2.1mi',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Gold Gate Bridge',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              child: Icon(
                Icons.star_border,
                color: Colors.yellow[700],
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
