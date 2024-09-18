import 'package:flutter_bloc/flutter_bloc.dart';
import 'wardrobe_event.dart';
import 'wardrobe_state.dart';
import '../../../data/repository/wardrobe_repository.dart';

class WardrobeBloc extends Bloc<WardrobeEvent, WardrobeState> {
  final WardrobeRepository wardrobeRepository;

  WardrobeBloc(this.wardrobeRepository) : super(WardrobeLoading()) {
    on<LoadWardrobeItems>(_onLoadWardrobeItems);  // 注册事件处理器
  }

  // 处理 LoadWardrobeItems 事件
  void _onLoadWardrobeItems(LoadWardrobeItems event, Emitter<WardrobeState> emit) async {
    emit(WardrobeLoading());  // 显示加载中的状态
    try {
      final items = await wardrobeRepository.fetchClothingItems();
      emit(WardrobeLoaded(items));  // 数据加载成功
    } catch (e) {
      emit(WardrobeError('Failed to load wardrobe items'));
    }
  }
}
