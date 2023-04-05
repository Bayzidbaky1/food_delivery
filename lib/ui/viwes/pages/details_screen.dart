import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery/ui/widgets/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailsScreen extends StatefulWidget {
  var data;
  DetailsScreen({required this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var dotPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            widget.data['title'],
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3.5,
                child: CarouselSlider(
                    items: widget.data['img_url']
                        .map<Widget>((item) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(item),
                                      fit: BoxFit.fitWidth)),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (val, carouselPageChangeReason) {
                          setState(() {
                            dotPosition = val;
                          });
                        })),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: DotsIndicator(
                  dotsCount: widget.data.length,
                  position: dotPosition,
                  decorator: DotsDecorator(
                    color: Colors.black87, // Inactive color
                    activeColor: Colors.redAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data['title'],
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 12,
                    ),
                    Text(widget.data['description'],
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('\$ ${widget.data['price'].toString()}',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton('CheckOut', () {})
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
