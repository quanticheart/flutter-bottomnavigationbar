import 'package:bottomview/core/extentions/generator_ext.dart';
import 'package:bottomview/src/subPages/dashboard.dart';
import 'package:bottomview/src/subPages/emails.dart';
import 'package:bottomview/src/subPages/home.dart';
import 'package:bottomview/src/subPages/profile.dart';
import 'package:flutter/material.dart';

class FakeRepo {
  final List<BottomNavigationBarItem> _items = [];
  final List<Widget> _pages = [];

  getMenu(Function(List<BottomNavigationBarItem>, List<Widget>) callback) {
    countdown(5, () => {_restartMenu(callback)});
  }

  _restartMenu(Function(List<BottomNavigationBarItem>, List<Widget>) callback) {
    _pages.clear();
    _items.clear();
    var quantity = randomNumber(4, min: 2);
    var list = randomListNumber(quantity);
    for (var element in list) {
      _createMenu(element);
    }
    callback(_items, _pages);
    getMenu(callback);
  }

  _createMenu(int index) {
    late HomeMenuItem menu;
    switch (index) {
      case 1:
        menu = _getHome();
        break;
      case 2:
        menu = _getDashboard();
        break;
      case 3:
        menu = _getEmail();
        break;
      case 4:
        menu = _getProfile();
        break;
    }

    _pages.add(menu.page);
    _items.add(menu.navItem);
  }

  HomeMenuItem _getHome() => HomeMenuItem(
      const BottomNavigationBarItem(
        icon: Icon(Icons.ad_units_sharp),
        label: "home",
      ),
      const ScreenHome());

  HomeMenuItem _getProfile() => HomeMenuItem(
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded),
        label: "profile",
      ),
      const ScreenProfile());

  HomeMenuItem _getEmail() => HomeMenuItem(
      const BottomNavigationBarItem(
        icon: Icon(Icons.email),
        label: "emails",
      ),
      ScreenEmails(inScrollDown: (bool) {}));

  HomeMenuItem _getDashboard() => HomeMenuItem(
      const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: "dash",
      ),
      const ScreenDashboard());
}

class HomeMenuItem {
  final BottomNavigationBarItem navItem;
  final Widget page;

  HomeMenuItem(this.navItem, this.page);
}
