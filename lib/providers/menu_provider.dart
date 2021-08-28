import 'package:flutter/cupertino.dart';

class MenuProvider with ChangeNotifier {
  // Friends = 0
  // Stage Discover = 1
  // Nitro = 2
  int _selectedMenu = 0;

  int get currentMenu => this._selectedMenu;
  void changeMenu(newMenu) {
    _selectedMenu = newMenu;
    notifyListeners();
  }

  int _selectedFriendFilter = 0;
  int get selectedFriendFilter => this._selectedFriendFilter;
  void changeFriendFilter(newFilter) {
    _selectedFriendFilter = newFilter;
    notifyListeners();
  }
}
