import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:new_project/MODEL/product.dart';



// class ProductProvider with ChangeNotifier{
//   Product product = Product(title: 'Nutritious fruit me...', imgUrl: 'assetc/images/images.jpg');
// }
class ProductProvider with ChangeNotifier {
  final _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
     
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  List get items {
    return [..._items];
  }
  Product getById(String id) {
    return items.firstWhere((element) => element.id == id);
  }
    final productCollection = FirebaseFirestore.instance.collection('Products');

  Future addProductProduct()async{
    for(int i = 0 ; i<items.length; i++){
      productCollection.add(items[i].toJson());
    }
      notifyListeners();
    }
}