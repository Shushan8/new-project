import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screen/slider.dart';

final List<Widget> imageSliders = imgList
    .map(
      (item) => Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius:const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              item,
              fit: BoxFit.cover,
              width: 1000,
              height: 180,
            ),
          ),
          Positioned(
            top: 130,
            left: 15,
            right: 15,
            child: Container(
              height: 140,
              decoration:const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0,4),
                      blurRadius: 5
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              padding:const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const  Text(
                    'Nutritious fruit me...',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.star_sharp,
                            size: 18,
                            color: Color.fromARGB(230, 137, 218, 209),
                          ),
                          Icon(
                            Icons.star_sharp,
                            size: 18,
                            color: Color.fromARGB(230, 137, 218, 209),
                          ),
                          Icon(
                            Icons.star_sharp,
                            size: 18,
                            color: Color.fromARGB(230, 137, 218, 209),
                          ),
                          Icon(
                            Icons.star_sharp,
                            size: 18,
                            color: Color.fromARGB(230, 137, 218, 209),
                          ),
                          Icon(
                            Icons.star_sharp,
                            size: 18,
                            color: Color.fromARGB(230, 137, 218, 209),
                          )
                        ],
                      ),
                    const  Text(
                        '  4 5  1287  comments',
                        style: TextStyle(
                            color: Color.fromARGB(209, 158, 158, 158)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color:const Color.fromARGB(236, 255, 167, 35),
                            ),
                          ),
                      const    Text('Normal',
                              style: TextStyle(
                                  color: Color.fromARGB(209, 158, 158, 158)))
                        ],
                      ),
                      Row(
                        children:const [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                          Text('1 7km',
                              style: TextStyle(
                                  color: Color.fromARGB(209, 158, 158, 158)))
                        ],
                      ),
                      Row(
                        children:const [
                          Icon(
                            Icons.watch_later_outlined,
                            color: Colors.pink,
                          ),
                          Text('32min',
                              style: TextStyle(
                                  color: Color.fromARGB(209, 158, 158, 158)))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    )
    .toList();
