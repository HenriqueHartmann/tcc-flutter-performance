import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_performance_app/src/features/bloc/title_state.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class TitleBloc extends Cubit<TitleState> {
  TitleBloc({required ItemListModel data}) : super(TitleState(data: data));

  TitleState _getState() {
    return state;
  }

  // State Changes
  void changeAllColors() {
    _getState()
        .getData()
        .changeAllTitleFontColor(!_getState().getSwitchAllColors());

    emit(_getState().copyWith(
        switchAllColors: !_getState().getSwitchAllColors(),
        data: _getState().getData()));
  }

  void changeColorByIndex({required int index}) {
    _getState()
        .getDataItemByIndex(index: index)
        .changeTitleFontColor();

    emit(_getState().copyWith(data: _getState().getData()));
  }

  void changeAllFontSizes() {
    _getState()
        .getData()
        .changeAllTitleFontSizes(!_getState().getSwitchAllFontSize());

    emit(_getState().copyWith(
        switchAllFontSize: !_getState().getSwitchAllFontSize(),
        data: _getState().getData()));
  }
}
