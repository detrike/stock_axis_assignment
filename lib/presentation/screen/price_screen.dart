import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_axis_assignment/presentation/manager/price_screen_cubit.dart';
import 'package:stock_axis_assignment/presentation/manager/price_screen_state.dart';
import 'package:stock_axis_assignment/presentation/widget/shimmer_card.dart';

import '../widget/custom_app_bar.dart';
import '../widget/green_saving_banner.dart';
import '../widget/pricing_section.dart';
import '../widget/stock_card.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PriceScreenCubit>().fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pricing',
        onBackPressed: () {
          // Custom back action if needed
        },
      ),
      body: Column(
        children: [
          const SavingsBanner(
            message: 'You will save Rs. 5000 on this plan',
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<PriceScreenCubit, PriceScreenState>(
                builder: (context, state) {
                  if (state is PriceScreenLoaded) {
                    final stockCards = [
                      {
                        'icon': Icons.diamond,
                        'title': 'Little Masters',
                        'subtitle': 'Small cap',
                        'description': 'Invest in up-trending Smallcap stocks screened through MILARS strategy to generate wealth.',
                        'plans': [
                          '${state.littleMasterDataState?.productData[0].pDescription ?? ''} - ${state.littleMasterDataState?.productData[0].pAmount ?? ''}',
                         // '${state.littleMasterDataState?.productData[1].pDescription ?? ''} - ${state.littleMasterDataState?.productData[1].pAmount ?? ''}'
                        ],
                        'dropDownIndex': 1,
                      },
                      {
                        'icon': Icons.diamond,
                        'title': 'Emerging Market Leader',
                        'subtitle': 'Mid cap',
                        'description': 'Generate Wealth By Riding Momentum in Midcap stock screened through MILARS strategy',
                        'plans': [
                          '${state.emergingMarketState?.productData[0].pDescription ?? ''} - ${state.emergingMarketState?.productData[0].pAmount ?? ''}',
                        //  '${state.emergingMarketState?.productData[1].pDescription ?? ''} - ${state.emergingMarketState?.productData[1].pAmount ?? ''}'
                        ],
                        'dropDownIndex': 2,
                      },
                      {
                        'icon': Icons.diamond,
                        'title': 'Large Cap Focus',
                        'subtitle': 'Large cap',
                        'description': 'Achieve stable growth in your portfolio by investing in Bluechip stocks passed through MILARS strategy.',
                        'plans': [
                          '${state.largeCapFocusState?.productData[0].pDescription ?? ''} - ${state.largeCapFocusState?.productData[0].pAmount ?? ''}',
                         // '${state.largeCapFocusState?.productData[1].pDescription ?? ''} - ${state.largeCapFocusState?.productData[1].pAmount ?? ''}'
                        ],
                        'dropDownIndex': 3,
                      },
                    ];

                    return ListView.separated(
                      itemCount: stockCards.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final cardData = stockCards[index];
                        return StockCard(
                          icon: cardData['icon'] as IconData,
                          title: cardData['title'] as String,
                          subtitle: cardData['subtitle'] as String,
                          description: cardData['description'] as String,
                          plans: cardData['plans'] as List<String> ,
                          dropDownIndex: cardData['dropDownIndex'] as int ,
                        );
                      },
                    );
                  } else {
                    return ListView.separated(
                      itemCount: 3, // Display shimmer cards for loading state
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) => const ShimmerCard(),
                    );
                  }
                },
              ),
            ),
          ),
          BlocBuilder<PriceScreenCubit, PriceScreenState>(
            builder: (context, state) {
              final priceText = state is PriceScreenLoaded
                  ? 'Rs. ${state.totalPrice}\nInclusive GST'
                  : 'Rs. 0\nInclusive GST';

              return PricingSection(
                priceText: priceText,
                onPaymentPressed: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
