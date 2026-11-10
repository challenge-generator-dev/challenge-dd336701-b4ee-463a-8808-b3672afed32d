import 'package:dio/dio.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';

class ApiClient {
  final Dio _dio;
  final String baseUrl;

  ApiClient({required this.baseUrl, Dio? dio})
      : _dio = dio ?? Dio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<Order> createOrder(OrderRequest orderRequest) async {
    try {
      final response = await _dio.post(
        '/orders',
        data: orderRequest.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Order.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ApiException(
          message: 'Error al crear la orden',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Order> getOrder(String orderId) async {
    try {
      final response = await _dio.get('/orders/$orderId');

      if (response.statusCode == 200) {
        return Order.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ApiException(
          message: 'Error al obtener la orden',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  ApiException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(
          message: 'Tiempo de conexión agotado. Verifica tu conexión a internet.',
          statusCode: null,
        );
      case DioExceptionType.sendTimeout:
        return ApiException(
          message: 'Tiempo de envío agotado. Intenta de nuevo.',
          statusCode: null,
        );
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: 'Tiempo de recepción agotado. El servidor está tardando demasiado.',
          statusCode: null,
        );
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = _extractErrorMessage(error.response?.data);
        return ApiException(
          message: message,
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return ApiException(
          message: 'Solicitud cancelada.',
          statusCode: null,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: 'Error de conexión. Verifica tu conexión a internet.',
          statusCode: null,
        );
      default:
        return ApiException(
          message: 'Error desconocido: ${error.message}',
          statusCode: null,
        );
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data == null) {
      return 'Error del servidor';
    }
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ?? 
             data['error'] as String? ?? 
             'Error del servidor';
    }
    return 'Error del servidor';
  }

  void dispose() {
    _dio.close();
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  @override
  String toString() {
    if (statusCode != null) {
      return 'ApiException: $message (Status: $statusCode)';
    }
    return 'ApiException: $message';
  }
}