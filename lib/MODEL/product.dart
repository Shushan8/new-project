import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String title;
  final String imageUrl;
  bool isFaworite;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.isFaworite = false,
  });
   factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}
