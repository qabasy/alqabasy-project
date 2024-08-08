// employees_model.dart
class Employee {
  final int? id;
  final String? name;
  final String? position;
  final int? status;
  final DateTime? createDate;
  final DateTime? updateDate;

  Employee({
    required this.id,
    required this.name,
    required this.position,
    required this.status,
    this.createDate,
    this.updateDate,
  });
}

// customers_model.dart
class Customer {
  // Similar structure as Employee
}

// companies_model.dart
class Company {
  // Similar structure as Employee, plus a description field
}

// products_model.dart
class Product {
  // Similar structure as Employee, plus price, companyID, and employeeID fields
}

// units_model.dart
class Unit {
  // Similar structure as Employee, plus description and price fields
}

// purchases_model.dart
class Purchase {
  // Similar structure as Employee, plus productID, customerID, price, unitID, and total fields
}

// customer_addresses_model.dart
class CustomerAddress {
  // Similar structure as Employee, plus an address field
}

// company_addresses_model.dart
class CompanyAddress {
  // Similar structure as Employee, plus an address field
}
