class ApiConstants {
  static const String defaultBaseUrl = 'https://load_balancer_dns/api';
  
  static const String ordersEndpoint = '/orders';
  
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

class AppConstants {
  static const String appName = 'Mobile Order App';
  static const String appVersion = '1.0.0';
  
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
  
  static const int pageSize = 20;
  static const int cacheMaxAge = 300;
}

class StorageKeys {
  static const String authToken = 'auth_token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String lastSync = 'last_sync';
  static const String cachedOrders = 'cached_orders';
}

class OrderStatus {
  static const String pending = 'pending';
  static const String confirmed = 'confirmed';
  static const String processing = 'processing';
  static const String shipped = 'shipped';
  static const String delivered = 'delivered';
  static const String cancelled = 'cancelled';

  static const List<String> activeStatuses = [
    pending,
    confirmed,
    processing,
    shipped,
  ];

  static const List<String> finalStatuses = [
    delivered,
    cancelled,
  ];

  static bool isActive(String status) => activeStatuses.contains(status);
  static bool isFinal(String status) => finalStatuses.contains(status);
}

class ErrorMessages {
  static const String networkError = 'Error de conexión. Verifica tu conexión a internet.';
  static const String serverError = 'Error del servidor. Intenta de nuevo más tarde.';
  static const String timeoutError = 'Tiempo de espera agotado. Intenta de nuevo.';
  static const String unknownError = 'Ocurrió un error inesperado.';
  static const String unauthorizedError = 'No autorizado. Inicia sesión nuevamente.';
  static const String notFoundError = 'Recurso no encontrado.';
  static const String validationError = 'Datos inválidos. Verifica la información ingresada.';
}

class RegexPatterns {
  static final RegExp email = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp phone = RegExp(
    r'^\+?[1-9]\d{1,14}$',
  );
  static final RegExp uuid = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
  );
}