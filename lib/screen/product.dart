import 'package:flutter/material.dart';
import 'package:new_project/MODEL/product.dart';
import 'package:new_project/provider/cart_provider.dart';
import 'package:new_project/provider/productProvider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({ required this.id,super.key, required this.product,required this.imageUrl });
  final String id;
  final Product product; 
  final String imageUrl;
  

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String descText =
      "This aromatic type og biryani is popular in Pakistan and known for spicy tast, fragrant rice, and delicate meat. This biryan is one of Indias most p...  \ntype og biryani is popular in Pakistan and known for spicy tast, fragrant rice, and delicate meat. This biryan ";
  bool descTextShowFlag = false;
  

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final cardData = Provider.of<Cart>(context);

    
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      (Image.network(
                        widget.imageUrl,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                    ],
                  )),
              Positioned(
                  child: Container(
                width: double.infinity,
                height: 790,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child:const Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                               const Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                          InkWell(

                            onTap: () {
                               cardData.addItemToTeCart(widget.product);
                               
                              print(cardData.cartItems);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: cardData.cartItems.contains(widget.product) ?Color.fromARGB(230, 137, 218, 209) : Color.fromARGB(255, 243, 188, 117),
                                    borderRadius: BorderRadius.circular(50)),
                                width: 40,
                                height: 40,
                                child: Icon(Icons.shopping_cart_outlined)),
                          )

                        ],
                      ),
                    ),
                    Container(
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 550,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                        children: [
                          Column(
                            children: [
                               Center(
                                child: Text(
                                  widget.product.title,
                                  style: const TextStyle(fontSize: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),

                              
                                child: Column(
                                  children: [
                                    Text(
                                      descText,
                                      maxLines: descTextShowFlag ? 12 : 4,
                                      textAlign: TextAlign.start,
                                      style:const TextStyle(
                                          fontSize: 19,
                                          color: Colors.grey,
                                          height: 2),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          descTextShowFlag = !descTextShowFlag;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          descTextShowFlag
                                              ?const Text(
                                                  "Show Less",
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                )
                                              :const Text("Show More",
                                                  style: TextStyle(
                                                      color: Colors.blue))
                                        ],
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            
                            height: 170,
                            width: 280,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color:const Color.fromARGB(
                                                230, 137, 218, 209)),
                                        child:const Icon(Icons.remove)),
                                const    Text(
                                      '12.88 x 0',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color:const Color.fromARGB(
                                                230, 137, 218, 209)),
                                        child: const Icon(Icons.add)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                const    Icon(
                                      Icons.favorite,
                                      color: Color.fromARGB(230, 137, 218, 209),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:const Color.fromARGB(
                                              230, 137, 218, 209)),
                                      width: 180,
                                      height: 70,
                                      child:const Center(
                                          child: Text(
                                        '10 | Add to cart',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
