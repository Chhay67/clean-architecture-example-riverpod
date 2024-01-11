class ProductEntity{
  ProductEntity({
     required this.id,
     required this.title,
     required this.price,
     required this.description,
     required this.category,
     required this.image,
     required this.rating,
});
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final num rate;
  final int count;

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  factory Rating.fromJson(Map<String, dynamic> json){
    return Rating(
      rate: json["rate"] ?? 0.0 ,
      count: json["count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };

  @override
  String toString(){
    return "$rate, $count, ";
  }
}
