class Purchase {
  final int id;
  final int productId;
  final int customerId;
  final double price;
  final int unitId;
  final double total;
  final int employeeId;
  final DateTime? createDate;
  final DateTime? updateDate;

  Purchase({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.price,
    required this.unitId,
    required this.total,
    required this.employeeId,
    this.createDate,
    this.updateDate,
  });
}
