class ProductModel {
  final int id;
  final String 
   title,
   descripion, 
   image, 
   category;
  final double price;
  final RatingModel rating;
 
  ProductModel({
    required this.category,
    required this.rating,
    required this.id,
    required this.title,
    required this.descripion,
    required this.image,
    required this.price,
  });
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      category: jsonData["category"],
      rating: RatingModel.fromjson(jsonData['rating']),
      id: jsonData["id"],
      title: jsonData["title"],
      descripion: jsonData["description"],
      image: jsonData["image"],
      price: ((jsonData["price"] as num)).toDouble(),
    );
  }
}

class RatingModel {
  final String rate;
  final int count;
  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.fromjson(jsonData) {
    return RatingModel(
      rate: jsonData["rate"].toString(),
      count: jsonData['count'],
    );
  }
}
