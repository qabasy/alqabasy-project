class Order {
  final int id;
  final int clientId;
  final double amount;
  final String product;
  final double price;
  final String location;
  final double discount;
  final int driverId;

  Order({
    required this.id,
    required this.clientId,
    required this.amount,
    required this.product,
    required this.price,
    required this.location,
    required this.discount,
    required this.driverId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clientId': clientId,
      'amount': amount,
      'product': product,
      'price': price,
      'location': location,
      'discount': discount,
      'driverId': driverId,
    };
  }
}
