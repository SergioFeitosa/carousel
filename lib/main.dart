import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.2,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                //onPageChanged: callbackFunction,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              items: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        height: 100,
                        width: 100,
                        //width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: i == _currentIndex
                            ? const BoxDecoration(
                                color: Colors.orange,
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/images/bebidas.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const BoxDecoration(
                                image:  DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/images/baiaodedois2.jpg'),
                                  fit: BoxFit.cover,
                                  opacity: 0.5
                              ),
                            ),
                        child: const Text(
                          '',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
