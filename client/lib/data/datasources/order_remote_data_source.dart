import 'package:dio/dio.dart';
import 'package:mobile_order_app/domain/entities/order.dart';

abstract class OrderRemoteDataSource {
  Future<Order> createOrder(OrderRequest orderRequest);
  Future<Order> getOrder(String orderId);
}

class OrderRequest {
  final String productId;
  final int quantity;
  final String customerId;

  OrderRequest({
    required this.productId,
    required this.quantity,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'customerId': customerId,
    };
  }
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  OrderRemoteDataSourceImpl({
    required this.dio,
    required this.baseUrl,
  });

  @override
  Future<Order> createOrder(OrderRequest orderRequest) async {
    try {
      final response = await dio.post(
        '$baseUrl/orders',
        data: orderRequest.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = response.data as Map<String, dynamic>;
        return Order.fromJson(json);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Error al crear pedido: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<Order> getOrder(String orderId) async {
    try {
      final response = await dio.get(
        '$baseUrl/orders/$orderId',
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        return Order.fromJson(json);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Error al obtener pedido: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Tiempo de conexión agotado. Verifique su conexión a internet.');
      case DioExceptionType.connectionError:
        return Exception('No se pudo conectar al servidor. Verifique la URL y su conexión.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Error del servidor';
        if (statusCode == 404) {
          return Exception('Pedido no encontrado');
        } else if (statusCode == 400) {
          return Exception('Solicitud inválida: $message');
        } else if (statusCode == 500) {
          return Exception('Error interno del servidor');
        }
        return Exception('Error del servidor: $statusCode - $message');
      case DioExceptionType.cancel:
        return Exception('Solicitud cancelada');
      default:
        return Exception('Error de red: ${e.message}');
    }
  }
}