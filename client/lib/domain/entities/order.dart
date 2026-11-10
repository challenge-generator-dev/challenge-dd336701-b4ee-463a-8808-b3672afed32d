package domain.entities;

import 'package:flutter/foundation.dart';

/// Entidad que representa un pedido en el dominio.
/// Contiene los datos esenciales de un pedido realizado por un cliente.
class Order {
  final String id;
  final String productId;
  final int quantity;
  final String customerId;
  final String status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.customerId,
    required this.status,
    required this.createdAt,
  });

  /// Crea una instancia de [Order] a partir de un mapa JSON.
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      customerId: json['customerId'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  /// Convierte la entidad [Order] a un mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'customerId': customerId,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Crea una copia de la entidad [Order] con los campos actualizados.
  Order copyWith({
    String? id,
    String? productId,
    int? quantity,
    String? customerId,
    String? status,
    DateTime? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      customerId: customerId ?? this.customerId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Order &&
        other.id == id &&
        other.productId == productId &&
        other.quantity == quantity &&
        other.customerId == customerId &&
        other.status == status &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      productId,
      quantity,
      customerId,
      status,
      createdAt,
    );
  }
}