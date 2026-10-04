import 'package:flutter/material.dart';

class ResponsiveProductGrid extends StatelessWidget {
  const ResponsiveProductGrid({super.key});

  static const List<_Product> _products = [
    _Product(name: 'Wireless Headphones', price: '\$89.99', icon: Icons.headphones),
    _Product(name: 'Smart Watch', price: '\$129.00', icon: Icons.watch),
    _Product(name: 'Laptop Stand', price: '\$39.50', icon: Icons.laptop),
    _Product(name: 'Mechanical Keyboard', price: '\$74.99', icon: Icons.keyboard),
    _Product(name: 'Bluetooth Speaker', price: '\$55.00', icon: Icons.speaker),
    _Product(name: 'Webcam HD', price: '\$49.95', icon: Icons.videocam),
    _Product(name: 'Gaming Mouse', price: '\$34.99', icon: Icons.mouse),
    _Product(name: 'USB-C Hub', price: '\$42.00', icon: Icons.usb),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var columns = 2;
        if (constraints.maxWidth >= 900) {
          columns = 4;
        } else if (constraints.maxWidth >= 600) {
          columns = 3;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            childAspectRatio: 1.1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final product = _products[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(product.icon, size: 36, color: Colors.blue),
                    const SizedBox(height: 8),
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.price,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _Product {
  const _Product({
    required this.name,
    required this.price,
    required this.icon,
  });

  final String name;
  final String price;
  final IconData icon;
}
