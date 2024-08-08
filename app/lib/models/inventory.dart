class Inventory {
  final int id;
  final String location;
  final String name;
  final double maxCapacity;

  Inventory({
    required this.id,
    required this.location,
    required this.name,
    required this.maxCapacity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'location': location,
      'name': name,
      'maxCapacity': maxCapacity,
    };
  }
}
