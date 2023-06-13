import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_project/MODEL/product.dart';

class Cart with ChangeNotifier {
  bool isProductAdded = false;

  final shopServis = FirebaseFirestore.instance.collection('Sops');

  List cartItems = [];
  void addItemToTeCart(Product product) async {
    
    List result = [...cartItems];

    if (result.contains(product)) {
      final collectionRef = FirebaseFirestore.instance.collection('Sops');
      final futureQuery = collectionRef.get();
      QuerySnapshot querySnapshot = await shopServis
          .where('id', isEqualTo: product.id)
          .where('imageUrl', isEqualTo: product.imageUrl)
          .where('isFaworite', isEqualTo: product.isFaworite)
          .where('title', isEqualTo: product.title)
          .get();

      querySnapshot.docs.forEach((doc) async {
        await doc.reference.delete();
      });
    } else {
      result.add(product);
      shopServis.add(product.toJson());
    }

    cartItems = result;
    notifyListeners();
  }
}
