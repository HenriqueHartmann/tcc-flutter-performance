import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_performance_app/src/features/bloc/description_state.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class DescriptionBloc extends Cubit<DescriptionState> {
  DescriptionBloc({required ItemListModel data}) : super(DescriptionState(data: data));

  DescriptionState _getState() {
    return state;
  }

  // State Changes
  void changeAllColors() {
    _getState()
        .getData()
        .changeAllDescriptionFontColor(!_getState().getSwitchAllColors());

    emit(_getState().copyWith(
        switchAllColors: !_getState().getSwitchAllColors(),
        data: _getState().getData()));
  }

  void changeColorByIndex({required int index}) {
    _getState()
        .getDataItemByIndex(index: index)
        .changeDescriptionFontColor();

    emit(_getState().copyWith(data: _getState().getData()));
  }

    void changeAllFontSizes() {
    _getState()
        .getData()
        .changeAllDescriptionFontSizes(!_getState().getSwitchAllFontSize());

    emit(_getState().copyWith(
        switchAllFontSize: !_getState().getSwitchAllFontSize(),
        data: _getState().getData()));
  }
}