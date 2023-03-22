class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  final int itemCount;

  Product(
      {required this.id,
      required this.productName,
      required this.productImage,
      required this.productDescription,
      required this.itemCount,
      required this.price});
}
