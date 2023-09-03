import 'package:ecommerce/core/models/api/api_result_model.dart';

class ProductModel extends Serializable {
  int? id;
  int? categoryId;
  String? image;
  String? title;
  String? description;
  String? slug;
  int? weight;
  int? price;
  int? stock;
  dynamic discount;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.id,
    this.categoryId,
    this.image,
    this.title,
    this.description,
    this.slug,
    this.weight,
    this.price,
    this.stock,
    this.discount,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        categoryId: json["category_id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        slug: json["slug"],
        weight: json["weight"],
        price: json["price"],
        stock: json["stock"],
        discount: json["discount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "image": image,
        "title": title,
        "description": description,
        "slug": slug,
        "weight": weight,
        "price": price,
        "stock": stock,
        "discount": discount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
