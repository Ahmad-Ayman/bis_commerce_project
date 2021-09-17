import 'package:bis_commerce_project/layout/home_layout/home_cubit/home_states.dart';
import 'package:bis_commerce_project/models/items_model.dart';
import 'package:bis_commerce_project/modules/brands_screen/brands_screen.dart';
import 'package:bis_commerce_project/modules/categories_screen/categories_screen.dart';
import 'package:bis_commerce_project/modules/home_page_screen/home_page_screen.dart';
import 'package:bis_commerce_project/modules/myaccount_screen/my_account_screen.dart';
import 'package:bis_commerce_project/modules/wishlist_screen/wishlist_screen.dart';
import 'package:bis_commerce_project/shared/constatns.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndexDrawer = 0;
  int currentIndexBottomNavBar = 0;

  void changeSelectedDrawerItem(int index, context) {
    currentIndexDrawer = index;

    emit(ChangeDrawerIndexState());
  }

  void changeSelectedBottomNavBarItem(int index, context) {
    currentIndexBottomNavBar = index;

    emit(ChangeBottonNavBarIndexState());
  }

  List<String> screenTitles = [
    'FRAGRANCES',
    'ORIENTAL FRAGRANCES',
    'MAKE UP',
    'SKIN CARE',
    'HAIR CARE',
    'BATH & BODY',
    'EYEWEAR',
    'WATCHES',
    'LIFESTYLE',
    'SMART TECH',
  ];
  List<String> bottomNavTitles = [
    'Home',
    'Category',
    'Brands',
    'Wishlist',
    'My Account',
  ];
  List<IconData> drawerItemsIcons = [
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined,
    Icons.ac_unit_outlined
  ];
  List<IconData> bottomNavItemsIcons = [
    Icons.home,
    Icons.list_alt,
    Icons.storage,
    Icons.favorite_outline_rounded,
    Icons.person_outline,
  ];
  List<Widget> screensForDrawer = [];
  List<Widget> screensForBottomNavBar = [
    HomePageScreen(),
    CategoriesScreen(),
    BrandsScreen(),
    WishListScreen(),
    MyAccountScreen(),
  ];
  List<String> carouselImmagesLinks = [
    'https://timelinecovers'
        '.pro/facebook-cover/download/ultra-hd-space-facebook-cover.jpg',
    'https://i.pinimg.com/originals/1e/cb/9c/1ecb9c5b4944e504aea46a19909690d2.jpg',
    'https://9cover.com/images/ccovers/1465154943spiral-galaxy-space.jpg',
    'https://timelinecovers.pro/facebook-cover/download/blue-space-facebook-cover.jpg',
  ];
}
