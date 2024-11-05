import 'package:bloc/bloc.dart';
import 'package:stock_axis_assignment/presentation/manager/price_screen_state.dart';

import '../../data/data_source/remote/api_service.dart';

class PriceScreenCubit extends Cubit<PriceScreenState> {
  final ApiService apiService;
  PriceScreenCubit(this.apiService) : super(PriceScreenInitial());

  // Function to fetch all api Master Data
  Future<void> fetchAllData() async {
    try {
      emit(PriceScreenLoading());
      final littleMasterData = await apiService.getLittleMasterApi();
      final emergingData = await apiService.getEmergingMarKetApi();
      final largeCapData = await apiService.getLargeCapFocusApi();
      emit(
        PriceScreenLoaded(
          littleMasterDataState: LittleMasterDataState(
            littleMasterData.data ?? [],
          ),
          emergingMarketState: EmergingMarketState(
            emergingData.data ?? [],
          ),
          largeCapFocusState: LargeCapFocusState(
            largeCapData.data ?? [],
          ),
        ),
      );
    } catch (e) {
      emit(PriceScreenError("Failed to load data"));
    }
  }

  // Function to update total amount
  void totalAmount(
      {String? price, String? removePrice, required int dropdownIndex}) {
    if (state is PriceScreenLoaded) {
      final currentState = state as PriceScreenLoaded;
      int updatedPrice = 0;
      Map<int, int> selectedPrices =
          Map.from(currentState.selectedPrices ?? {});

      if (price != null && price.isNotEmpty) {
        final newPrice = int.parse(price.split('-').last);
        selectedPrices[dropdownIndex] = newPrice;
      } else if (removePrice != null && removePrice.isNotEmpty) {
        selectedPrices.remove(dropdownIndex);
      }

      updatedPrice = selectedPrices.values.fold(0, (sum, item) => sum + item);

      if (selectedPrices.length == 2) {
        updatedPrice = (updatedPrice * 0.8).round();
      }

      emit(currentState.copyWith(
          totalPrice: updatedPrice, selectedPrices: selectedPrices));
    }
  }
}
