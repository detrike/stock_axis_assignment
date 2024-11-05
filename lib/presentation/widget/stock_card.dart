import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_axis_assignment/presentation/manager/price_screen_cubit.dart';

class StockCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final List<String> plans;
  final IconData icon;
  final int dropDownIndex;

  const StockCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.plans,
    required this.icon,
    required this.dropDownIndex
  });

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  String? selectedPlan;
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.icon, color: Colors.orange),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.info, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              height: 1.5,
              color: Colors.black.withOpacity(0.7),
            ),
            const SizedBox(height: 8),
            Text(widget.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                border: Border.all(
                  color:
                      isFocused ? Colors.green : Colors.grey.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Select a Plan (inclusive of GST)"),
                  value: selectedPlan,
                  items: widget.plans.map((plan) {
                    return DropdownMenuItem<String>(
                      value: plan,
                      child: Text(plan),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (selectedPlan == value) {
                        context.read<PriceScreenCubit>().totalAmount(removePrice: value ?? '', dropdownIndex: widget.dropDownIndex);
                        selectedPlan = null;
                        isFocused = false;
                        return;
                      }
                      selectedPlan = value;
                      context.read<PriceScreenCubit>().totalAmount(price: value ?? '', dropdownIndex: widget.dropDownIndex);
                      if (selectedPlan!.isEmpty || selectedPlan == null) {
                        isFocused = false;
                      } else {
                        isFocused = true;
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
