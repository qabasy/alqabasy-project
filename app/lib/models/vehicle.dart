class Vehicle {
  final int id;
  final String name;
  final double maxCapacity;

  Vehicle({
    required this.id,
    required this.name,
    required this.maxCapacity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'maxCapacity': maxCapacity,
    };
  }
}
