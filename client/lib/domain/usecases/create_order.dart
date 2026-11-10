package domain.usecases;

import '../entities/order.dart';
import '../repositories/order_repository.dart';

/// Caso de uso para crear un pedido.
/// Encapsula la lógica de negocio para la creación de pedidos.
class CreateOrder {
  final OrderRepository orderRepository;

  CreateOrder(this.orderRepository);

  /// Ejecuta la creación de un pedido.
  /// [orderRequest]: Los datos del pedido a crear.
  /// Retorna un [Future] que se completa con la entidad [Order] creada.
  Future<Order> call(OrderRequest orderRequest) async {
    if (orderRequest.quantity <= 0) {
      throw ArgumentError('La cantidad debe ser mayor que cero.');
    }
    if (orderRequest.productId.isEmpty) {
      throw ArgumentError('El ID del producto no puede estar vacío.');
    }
    if (orderRequest.customerId.isEmpty) {
      throw ArgumentError('El ID del cliente no puede estar vacío.');
    }

    return await orderRepository.createOrder(orderRequest);
  }
}