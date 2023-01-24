import 'package:tawasol_app/base.dart';
import 'package:tawasol_app/database_utils/database_utils.dart';
import 'package:tawasol_app/screens/home/home_navigator.dart';

import '../../models/room.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<Room> rooms = [];

  void getRooms() {
    DataBaseUtils.getRoomsFromFirestore().then((value) {
      rooms = value;
    }).catchError((error) {
      navigator!.showMessage(error.toString());
    });
  }
}
