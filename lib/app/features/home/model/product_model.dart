class ProductModel {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  // Para pegar produtos no Get
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images']),
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }

  //Para criar um produto utilizando o metodo Post
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'categoryId': 3,
      'images': images, 
    };
  }
}
