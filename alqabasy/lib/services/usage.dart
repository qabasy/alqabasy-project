import '../models/product.dart';
import 'product_service.dart';

void main() async {
  // final userService = UserService();
  final productService = ProductService();

  // Add a new user
  // await userService.addUser(User(id: 1, name: 'John Doe', email: 'john@example.com', role: 'admin'));

  // Get all users
  // List<User> users = await userService.getUsers();
  // print(users);

  // Update a user
  // await userService.updateUser(1, User(id: 1, name: 'John Smith', email: 'johnsmith@example.com', role: 'admin'));

  // Delete a user
  // await userService.deleteUser(1);

  // Add a new product
  await productService.addProduct(Product(id: 1, name: 'Cotton', price: 100.0, category: 'Agriculture'));

  // Get all products
  List<Product> products = await productService.getProducts();
  print(products);

  // Update a product
  await productService.updateProduct(1, Product(id: 1, name: 'Organic Cotton', price: 120.0, category: 'Agriculture'));

  // Delete a product
  await productService.deleteProduct(1);
}
