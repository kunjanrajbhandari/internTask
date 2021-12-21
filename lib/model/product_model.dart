class ProductModel{
  int? id;
  String? productName;
  String? imageName;
  String? price;
  int? stock;
  int? date;
  String category;

  ProductModel({required this.id, required this.productName, required this.imageName, required this.price, required this.stock, required this.category, required this.date});
}