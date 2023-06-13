import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/MODEL/product.dart';
import 'package:new_project/provider/cart_provider.dart';
import 'package:new_project/screen/product.dart';
import 'package:new_project/screen/product_item.dart';
import 'package:new_project/screen/shop.dart';
import 'package:new_project/screen/sign_in.dart';
import 'package:new_project/widget/image.dart';
import 'package:provider/provider.dart';

final List<String> imgList = [
  'assetc/images/images.jpg',
  'assetc/images/img1.jpg',
  'assetc/images/img2.jpg',
  'assetc/images/img3.jpg',
  'assetc/images/img4.jpg',
  'assetc/images/images.png',
];

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final authService = FirebaseAuth.instance;
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (const Text('India',
                            style: TextStyle(
                                color: Color.fromARGB(230, 137, 218, 209)))),
                        InkWell(
                          onTap: () {
                            authService.signOut();
                          },
                          child: Row(
                            children: const [
                              Text('Delhi'),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(230, 137, 218, 209),
                                  borderRadius: BorderRadius.circular(13)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(230, 137, 218, 209),
                                borderRadius: BorderRadius.circular(13)),
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ShopScreen()));
                              },
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 310,
            child: Column(children: [
              Container(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            aspectRatio: 1.5,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromARGB(255, 0, 0, 0)
                                  : const Color.fromARGB(230, 137, 218, 209))
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 100,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Recommended',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Food paning',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(209, 158, 158, 158)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 360,
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Product')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return GridView(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 9 / 3,
                                  ),
                                  children: snapshot.data!.docs.map((document) {
                                    return ProductItem(
                                      product: Product(
                                        imageUrl: document['imageUrl'],
                                        id: document['id'],
                                        title: document['title'],
                                      ),
                                    );
                                  }).toList());
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
