import 'package:equatable/equatable.dart';

import '../../data/model/product_model.dart';

// State Base Class
abstract class PriceScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

// initial State
class PriceScreenInitial extends PriceScreenState {}

// loading state
class PriceScreenLoading extends PriceScreenState {}

// Success State with Data
class PriceScreenLoaded extends PriceScreenState {
  final LittleMasterDataState? littleMasterDataState;
  final EmergingMarketState? emergingMarketState;
  final LargeCapFocusState? largeCapFocusState;
  final int? totalPrice;
  final Map<int, int>? selectedPrices;

  PriceScreenLoaded({
    this.littleMasterDataState,
    this.largeCapFocusState,
    this.emergingMarketState,
    this.totalPrice = 0,
    this.selectedPrices = const {},
  });

  PriceScreenLoaded copyWith({
    LittleMasterDataState? littleMasterDataState,
    EmergingMarketState? emergingMarketState,
    LargeCapFocusState? largeCapFocusState,
    int? totalPrice,
    Map<int, int>? selectedPrices,
  }) {
    return PriceScreenLoaded(
      littleMasterDataState:
          littleMasterDataState ?? this.littleMasterDataState,
      emergingMarketState: emergingMarketState ?? this.emergingMarketState,
      largeCapFocusState: largeCapFocusState ?? this.largeCapFocusState,
      totalPrice: totalPrice ?? this.totalPrice,
      selectedPrices: selectedPrices ?? this.selectedPrices,
    );
  }

  @override
  List<Object?> get props => [
        littleMasterDataState,
        emergingMarketState,
        largeCapFocusState,
        totalPrice
      ];
}

// Little master api data state
class LittleMasterDataState extends PriceScreenState {
  final List<Data> productData;

  LittleMasterDataState(this.productData);

  @override
  List<Object?> get props => [productData];
}

// Emerging market data state
class EmergingMarketState extends PriceScreenState {
  final List<Data> productData;

  EmergingMarketState(this.productData);

  @override
  List<Object?> get props => [productData];
}

// Large cap focus data state
class LargeCapFocusState extends PriceScreenState {
  final List<Data> productData;

  LargeCapFocusState(this.productData);

  @override
  List<Object?> get props => [productData];
}

// Error State
class PriceScreenError extends PriceScreenState {
  final String message;

  PriceScreenError(this.message);

  @override
  List<Object?> get props => [message];
}
