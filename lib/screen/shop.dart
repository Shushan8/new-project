import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_project/MODEL/product.dart';
import 'package:new_project/provider/cart_provider.dart';
import 'package:new_project/screen/product_item.dart';
import 'package:new_project/screen/slider.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);

    final listOfProducts = cartData.cartItems;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(230, 137, 218, 209),
                          borderRadius: BorderRadius.circular(50)),
                      height: 50,
                      width: 50,
                      child:const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CarouselWithIndicatorDemo()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(230, 137, 218, 209),
                                borderRadius: BorderRadius.circular(50)),
                            height: 50,
                            width: 50,
                            child: const Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ShopScreen()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(230, 137, 218, 209),
                                borderRadius: BorderRadius.circular(50)),
                            height: 50,
                            width: 50,
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 720,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Sops')
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
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
