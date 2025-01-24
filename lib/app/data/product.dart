enum CodeType { UPC, EAN, ISBN }

class Product {
  final String code;
  final CodeType codeType;
  final String name;
  final String imageUrl;
  final String category;
  final double price;

  Product({
    required this.code,
    required this.codeType,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      code: json['code'],
      codeType: CodeType.values.firstWhere(
        (e) => e.toString() == 'CodeType.${json['codeType']}',
      ),
      name: json['product']['name'],
      imageUrl: json['product']['imageUrl'],
      category: json['product']['category'],
      price: json['product']['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'codeType': codeType.toString().split('.').last,
        'product': {
          'name': name,
          'imageUrl': imageUrl,
          'category': category,
        },
        'price': price,
      };
}
