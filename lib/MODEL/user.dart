import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String title;
  final String imageUrl;
  bool isFaworite;

  User({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.isFaworite = false,
  });
   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}
