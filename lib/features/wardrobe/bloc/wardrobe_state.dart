import '../../../core/models/clothing_item.dart';

abstract class WardrobeState {}

class WardrobeLoading extends WardrobeState {}

class WardrobeLoaded extends WardrobeState {
  final List<ClothingItem> clothingItems;

  WardrobeLoaded(this.clothingItems);
}

class WardrobeError extends WardrobeState {
  final String errorMessage;

  WardrobeError(this.errorMessage);
}
