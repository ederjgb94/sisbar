import '../models/product.dart';
import 'base_factory.dart';

class ProductFactory extends Factory<Product> {
  Function addItem;

  ProductFactory({
    required this.addItem,
  });

  void addProducts(int count) {
    createMany(count).forEach((product) {
      addItem(
        product.code,
        product.name,
        product.price,
        product.imageUrl,
        product.category,
        product.codeType,
      );
    });
  }

  @override
  Product create() {
    return Product(
      code: faker.randomGenerator.numberOfLength(13),
      codeType: CodeType.values[random.nextInt(CodeType.values.length)],
      name: faker.food.dish(),
      imageUrl: faker.image.loremPicsum(),
      category: faker.food.dish(),
      price: double.parse(
        faker.randomGenerator
            .decimal(
              min: 1,
              scale: 2,
            )
            .toStringAsFixed(2),
      ),
    );
  }
}
