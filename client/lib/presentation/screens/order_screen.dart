import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/domain/entities/order.dart';
import 'package:mobile_order_app/domain/repositories/order_repository.dart';
import 'package:mobile_order_app/domain/usecases/create_order.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('OrderRepository debe ser proveído por el contenedor');
});

final createOrderUseCaseProvider = Provider<CreateOrder>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return CreateOrder(repository);
});

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productIdController = TextEditingController();
  final _quantityController = TextEditingController();
  final _customerIdController = TextEditingController();
  
  bool _isLoading = false;
  String? _errorMessage;
  Order? _createdOrder;

  @override
  void dispose() {
    _productIdController.dispose();
    _quantityController.dispose();
    _customerIdController.dispose();
    super.dispose();
  }

  Future<void> _createOrder() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _createdOrder = null;
    });

    try {
      final createOrderUseCase = ref.read(createOrderUseCaseProvider);
      final orderRequest = OrderRequest(
        productId: _productIdController.text.trim(),
        quantity: int.parse(_quantityController.text.trim()),
        customerId: _customerIdController.text.trim(),
      );

      final order = await createOrderUseCase(orderRequest);
      
      setState(() {
        _createdOrder = order;
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pedido creado: ${order.id}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _getOrder(String orderId) async {
    if (orderId.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _createdOrder = null;
    });

    try {
      final repository = ref.read(orderRepositoryProvider);
      final order = await repository.getOrder(orderId);
      
      setState(() {
        _createdOrder = order;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crear nuevo pedido',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _productIdController,
                        decoration: const InputDecoration(
                          labelText: 'ID del producto',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.inventory_2),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingrese el ID del producto';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _quantityController,
                        decoration: const InputDecoration(
                          labelText: 'Cantidad',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.numbers),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingrese la cantidad';
                          }
                          final quantity = int.tryParse(value.trim());
                          if (quantity == null || quantity <= 0) {
                            return 'Cantidad inválida';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _customerIdController,
                        decoration: const InputDecoration(
                          labelText: 'ID del cliente',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingrese el ID del cliente';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _isLoading ? null : _createOrder,
                          icon: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Icon(Icons.send),
                          label: Text(_isLoading ? 'Creando...' : 'Crear pedido'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Consultar pedido',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'ID del pedido',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.search),
                              ),
                              onSubmitted: _getOrder,
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton.filled(
                            onPressed: _isLoading
                                ? null
                                : () {
                                    final controller = TextEditingController();
                                    _getOrder(controller.text);
                                  },
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (_errorMessage != null) ...
                [
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.red.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red.shade700),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: TextStyle(color: Colors.red.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              if (_createdOrder != null) ...
                [
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green.shade700),
                              const SizedBox(width: 12),
                              Text(
                                'Pedido encontrado',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          _buildOrderDetail('ID', _createdOrder!.id),
                          _buildOrderDetail('Producto', _createdOrder!.productId),
                          _buildOrderDetail('Cantidad', _createdOrder!.quantity.toString()),
                          _buildOrderDetail('Cliente', _createdOrder!.customerId),
                          _buildOrderDetail('Estado', _createdOrder!.status),
                          _buildOrderDetail(
                            'Creado',
                            _createdOrder!.createdAt.toLocal().toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}