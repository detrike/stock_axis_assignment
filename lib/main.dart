import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_axis_assignment/data/data_source/remote/api_service.dart';
import 'package:stock_axis_assignment/presentation/manager/price_screen_cubit.dart';
import 'package:stock_axis_assignment/presentation/screen/price_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PriceScreenCubit(ApiService()),
        child: const PricingScreen(),
      ),
    );
  }
}
