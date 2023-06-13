import 'package:flutter/material.dart';
import 'package:new_project/MODEL/product.dart';
import 'package:new_project/screen/product.dart';



class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
        body: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(
              id: product.id,
              product: product,
              imageUrl: product.imageUrl,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                  width: 190,
                  child: Text(
                  product.title,
                    style:const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.star_sharp,
                          size: 15,
                          color: Color.fromARGB(230, 137, 218, 209),
                        ),
                        Icon(
                          Icons.star_sharp,
                          size: 15,
                          color: Color.fromARGB(230, 137, 218, 209),
                        ),
                        Icon(
                          Icons.star_sharp,
                          size: 15,
                          color: Color.fromARGB(230, 137, 218, 209),
                        ),
                        Icon(
                          Icons.star_sharp,
                          size: 15,
                          color: Color.fromARGB(230, 137, 218, 209),
                        ),
                        Icon(
                          Icons.star_sharp,
                          size: 15,
                          color: Color.fromARGB(230, 137, 218, 209),
                        )
                      ],
                    ),
                    const Text(
                      '  4 5  1287  comments',
                      style:
                          TextStyle(color: Color.fromARGB(209, 158, 158, 158)),
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
                            color: const Color.fromARGB(236, 255, 167, 35),
                          ),
                        ),
                        const Text('Normal',
                            style: TextStyle(
                                color: Color.fromARGB(209, 158, 158, 158)))
                      ],
                    ),
                    Row(
                      children: const [
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
                      children: const [
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
        ],
      ),
    ));
  }
}
