import 'package:alqabasy/models/product.dart';
import 'package:alqabasy/services/database_service.dart';

class ProductService extends BaseDatabaseService<Product> {
  @override
  String get tableName => 'products';

  @override
  Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      category: map['category'],
    );
  }

  Future<void> addProduct(Product product) async {
    await add(product, {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'category': product.category,
    });
  }

  Future<List<Product>> getProducts() async {
    return await getAll();
  }

  Future<void> updateProduct(int id, Product product) async {
    await update(id, {
      'name': product.name,
      'price': product.price,
      'category': product.category,
    });
  }

  Future<void> deleteProduct(int id) async {
    await delete(id);
  }
}
