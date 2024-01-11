
import '../../domain/entity/product.dart';

class ProductModel extends ProductEntity{
  ProductModel({
    required int id,
    required String title,
    required num price,
    required String description,
    required String category,
    required String image,
    required Rating rating,
  }) : super(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating,
  );

  ProductModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: json["price"] ?? 0.0,
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      image: json["image"] ?? "",
      rating:  Rating.fromJson(json["rating"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toJson(),
  };

  @override
  String toString(){
    return "$id, $title, $price, $description, $category, $image, $rating, ";
  }
}

