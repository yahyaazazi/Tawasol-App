import 'package:tawasol_app/base.dart';
import 'package:tawasol_app/database_utils/database_utils.dart';
import 'package:tawasol_app/models/room.dart';
import 'package:tawasol_app/screens/add_room/add_room_navigator.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void CreateRoom(String roomName, String roomDescription, String catId) {
    Room room = Room(
        roomName: roomName, roomDescription: roomDescription, catId: catId);
    DataBaseUtils.AddRoomToFirestore(room).then((value) {
      navigator!.roomCreated();
    }).catchError((error) {
      navigator!.showMessage(error.toString());
    });
  }
}
