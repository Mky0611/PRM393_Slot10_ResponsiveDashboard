import 'package:flutter/material.dart';

import '../widgets/responsive_grid.dart';
import '../widgets/summary_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Dashboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard - Phước Thịnh',
                style: TextStyle(
                  fontSize: (screenWidth * 0.06).clamp(20.0, 32.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const _SummarySection(),
              const SizedBox(height: 24),
              const ResponsiveProductGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context) {
    const cards = [
      SummaryCard('Revenue', '\$12,300', Colors.blue),
      SummaryCard('Orders', '320', Colors.green),
      SummaryCard('Customers', '89', Colors.purple),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            children: [
              for (var index = 0; index < cards.length; index++) ...[
                if (index > 0) const SizedBox(height: 12),
                cards[index],
              ],
            ],
          );
        }

        return Row(
          children: [
            for (var index = 0; index < cards.length; index++) ...[
              if (index > 0) const SizedBox(width: 12),
              Expanded(child: cards[index]),
            ],
          ],
        );
      },
    );
  }
}
