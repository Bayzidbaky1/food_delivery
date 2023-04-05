import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ui/route/route.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BottomHomePage extends StatefulWidget {
  BottomHomePage({super.key});

  @override
  State<BottomHomePage> createState() => _BottomHomePageState();
}

class _BottomHomePageState extends State<BottomHomePage> {
  List<String> category = [
    "food",
    "electronics",
    "grocious",
    "womens",
    "Mans Fashion"
  ];

  List data = [];
  List<String> sliderImg = [];

  bool value = false;
  var dotPosition = 0;

  fetchData() {
    FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        data.add({
          'title': element['title'], //element title is from databse key title
          'description': element['description'],
          'img_url': element['img_url'],
          'price': element['price']
        });
      });
      setState(() {
        value = true;
      });
    });
  }

  fetchSliderImg() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot _querySnapshot =
        await _firestoreInstance.collection('slider_image').get();

    setState(() {
      for (var i = 0; i < _querySnapshot.docs.length; i++) {
        sliderImg.add(
          _querySnapshot.docs[i]['carosol_img'],
        );
        print(_querySnapshot.docs[i]['carosol_img']);
      }
    });
    return _querySnapshot.docs;
  }

  @override
  void initState() {
    fetchData();
    fetchSliderImg();
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            controller: ScrollController(keepScrollOffset: true),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 60),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: _searchController,
                                    cursorColor: Colors.grey,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black54)),
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          size: 28,
                                          color: Colors.grey,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            AspectRatio(
                              aspectRatio: 3.5,
                              child: CarouselSlider(
                                  items: sliderImg
                                      .map((item) => Container(
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
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.3,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged:
                                          (val, carouselPageChangeReason) {
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
                                dotsCount:
                                    sliderImg.length == 0 ? 1 : sliderImg.length,
                                position: dotPosition,
                                decorator: DotsDecorator(
                                  color: Colors.black87, // Inactive color
                                  activeColor: Colors.redAccent,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Categories",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFF4800)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: category.length,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Color(0xffC4C4C4)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12, top: 5),
                                          child: Text(
                                            category[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "All Products",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ];
            },
            body: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
                child: Visibility(
                  visible: value,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: data.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(details, arguments: data[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                            elevation: 3,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 217,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 28.0, top: 85),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index]['title'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "\$ ${data[index]['price']}",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: -50,
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                          NetworkImage(data[index]['img_url'][1]),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )));
  }
}
