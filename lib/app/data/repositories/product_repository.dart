import 'package:sisbar/app/data/providers/api_provider.dart';

class ProductRepository {
  final ApiProvider apiProvider = ApiProvider(
    idProject: 'sisbar-colab',
    model: 'products',
  );

  Future<Map<String, dynamic>> getAll() async {
    return apiProvider.getAll();
  }
}
