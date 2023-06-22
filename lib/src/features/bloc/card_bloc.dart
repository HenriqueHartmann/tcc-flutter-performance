import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_performance_app/src/features/bloc/card_state.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class CardBloc extends Cubit<CardState> {
  CardBloc({required ItemListModel data}) : super(CardState(data: data));

  CardState _getState() {
    return state;
  }

  // State Changes
  void changeAllColors() {
    _getState()
        .getData()
        .changeAllCardBackgroundColors(!_getState().getSwitchAllColors());

    emit(_getState().copyWith(
        switchAllColors: !_getState().getSwitchAllColors(),
        data: _getState().getData()));
  }

  void changeColorByIndex({required int index}) {
    _getState()
        .getDataItemByIndex(index: index)
        .changeCardBackgroundColor();

    emit(_getState().copyWith(data: _getState().getData()));
  }
}