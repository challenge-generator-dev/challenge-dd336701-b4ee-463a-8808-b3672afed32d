package domain.repositories;

import '../entities/order.dart';

/// Interfaz del repositorio para operaciones de pedidos.
/// Define los contratos que deben implementarse para interactuar con los pedidos.
abstract class OrderRepository {
  /// Crea un nuevo pedido.
  /// [orderRequest]: Los datos del pedido a crear.
  /// Retorna un [Future] que se completa con la entidad [Order] creada.
  Future<Order> createOrder(OrderRequest orderRequest);

  /// Obtiene un pedido por su identificador.
  /// [orderId]: El identificador del pedido.
  /// Retorna un [Future] que se completa con la entidad [Order] encontrada.
  Future<Order> getOrder(String orderId);
}

/// DTO para la creación de un pedido.
/// Contiene los datos necesarios para crear un pedido.
class OrderRequest {
  final String productId;
  final int quantity;
  final String customerId;

  OrderRequest({
    required this.productId,
    required this.quantity,
    required this.customerId,
  });

  /// Convierte el [OrderRequest] a un mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'customerId': customerId,
    };
  }
}