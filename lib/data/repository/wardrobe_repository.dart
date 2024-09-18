import '../local/database_helper.dart';
import '../../core/models/clothing_item.dart';

class WardrobeRepository {
  Future<List<ClothingItem>> fetchClothingItems() async {
    return await DatabaseHelper.instance.getClothingItems();
  }

  Future<void> addClothingItem(ClothingItem item) async {
    await DatabaseHelper.instance.addClothingItem(item);
  }
}
