import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeController extends ChangeNotifier {
  CarouselSliderController? _carouselController;
  PersistentTabController? _persistentTabController;
  PersistentTabController get persistentTabController {
    _persistentTabController ??= PersistentTabController(initialIndex: 0);
    return _persistentTabController!;
  }

  int _carouselIndex = 0;
  bool hideNavBar = false;
  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;
  int get carouselIndex => _carouselIndex;

  void jumpToBottomNavIndex(int index) {
    if (index < 0 || index > 3) return;
    _bottomNavIndex = index;
    persistentTabController.jumpToTab(index);
    notifyListeners();
  }

  void setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }

  void setCarouselIndex(int index) {
    _carouselIndex = index;
    notifyListeners();
  }

  void setHideNavBar(bool value) {
    hideNavBar = value;
    notifyListeners();
  }

  CarouselSliderController get carouselController {
    _carouselController ??= CarouselSliderController();
    return _carouselController!;
  }
}
