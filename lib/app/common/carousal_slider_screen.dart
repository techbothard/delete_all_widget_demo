import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousalSliderscreen extends StatefulWidget {
  const CarousalSliderscreen({super.key});

  @override
  State<CarousalSliderscreen> createState() => _CarousalSliderscreenState();
}

class _CarousalSliderscreenState extends State<CarousalSliderscreen> {
  List images = [
    "assets/images/img_image_1.png",
    "assets/images/img_image_2.png",
    "assets/images/img_image_3.png",
    "assets/images/img_image_4.png",
    "assets/images/img_image_5.png",
    "assets/images/img_image_6.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carousal"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              items: images
                  .map((e) => Image.asset(
                        e,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ))
                  .toList(),
              options: CarouselOptions(
                  height: 140,
                  viewportFraction: .7,
                  enlargeFactor: 0.3,
                  autoPlay: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  aspectRatio: 4 / 3,
                  autoPlayInterval: Duration(seconds: 3)),
            ),
            SizedBox(
              height: 30,
            ),
            CarouselSlider(
              items: images
                  .map((e) => Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          e,
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  height: 140,

                  // viewportFraction: 1,
                  autoPlay: true,
                  reverse: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: Duration(seconds: 3)),
            ),
            SizedBox(
              height: 30,
            ),
            CarouselSlider.builder(
                itemCount: 6,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    images[index],
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  );
                },
                options: CarouselOptions(
                  height: 130,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  // viewportFraction: 1,
                  animateToClosest: true,
                ))
          ],
        ),
      ),
    );
  }
}
