import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/wardrobe_bloc.dart';
import '../bloc/wardrobe_event.dart';
import '../bloc/wardrobe_state.dart';
import '../../../shared/widgets/clothing_card.dart';
import '../../../data/repository/wardrobe_repository.dart';

class WardrobeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的衣柜'),
      ),
      body: BlocProvider(
        create: (context) => WardrobeBloc(WardrobeRepository())..add(LoadWardrobeItems()),
        child: BlocBuilder<WardrobeBloc, WardrobeState>(
          builder: (context, state) {
            if (state is WardrobeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WardrobeLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: state.clothingItems.length,
                itemBuilder: (context, index) {
                  return ClothingCard(clothingItem: state.clothingItems[index]);
                },
              );
            } else if (state is WardrobeError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Center(child: Text('未知错误'));
            }
          },
        ),
      ),
    );
  }
}
