mixin Model {
  static final Map<Type, dynamic> _factories = {};

  static void registerFactory<T>(dynamic factory) {
    _factories[T] = factory;
  }

  static T factory<T>() {
    if (!_factories.containsKey(T)) {
      throw Exception('Factory for type $T not registered');
    }
    return _factories[T] as T;
  }
}
