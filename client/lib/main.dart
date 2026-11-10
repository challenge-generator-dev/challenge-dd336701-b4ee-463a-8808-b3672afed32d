import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/core/utils/constants.dart';
import 'package:mobile_order_app/presentation/screens/order_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Order App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OrderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// === Provider para el cliente HTTP ===
final dioProvider = Provider((ref) {
  final dio = Dio();
  dio.options.baseUrl = Constants.apiBaseUrl;
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
});

// === Modelos para la API ===
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

class OrderResponse {
  final String id;
  final String productId;
  final int quantity;
  final String customerId;
  final String status;
  final DateTime createdAt;

  OrderResponse({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.customerId,
    required this.status,
    required this.createdAt,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      customerId: json['customerId'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}