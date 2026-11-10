import 'package:mobile_order_app/domain/entities/order.dart';
import 'package:mobile_order_app/domain/repositories/order_repository.dart';
import 'package:mobile_order_app/data/datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Order> createOrder(OrderRequest orderRequest) async {
    final remoteRequest = OrderRequest(
      productId: orderRequest.productId,
      quantity: orderRequest.quantity,
      customerId: orderRequest.customerId,
    );
    
    return await remoteDataSource.createOrder(remoteRequest);
  }

  @override
  Future<Order> getOrder(String orderId) async {
    if (orderId.isEmpty) {
      throw ArgumentError('El ID del pedido no puede estar vacío');
    }
    
    return await remoteDataSource.getOrder(orderId);
  }
}