class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Rating ?rate;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image, required this.rate});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      category: jsonData["category"],
      image: jsonData["image"],
      rate:  jsonData['rating']==null?null: Rating.fromJson(jsonData["rating"])
    );
  }
}

class Rating {
  final dynamic rate;
  final int count;

  Rating({required this.rate, required this.count});
  factory Rating.fromJson(jsonData) {
    return Rating(rate: jsonData['rate'], count: jsonData['count']);
  }
}
