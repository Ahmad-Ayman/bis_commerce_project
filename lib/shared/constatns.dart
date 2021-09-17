import 'package:bis_commerce_project/models/items_model.dart';
import 'package:bis_commerce_project/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void kNavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
void kNavigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

List<BoardingModel> kBoardingDetails = [
  BoardingModel(
    image: 'assets/svg/browse.svg',
    title: 'Browse Products',
    body: 'Find All our products in easy way with all info you need.',
    color: Colors.white,
  ),
  BoardingModel(
    image: 'assets/svg/filter.svg',
    title: 'Filter Products',
    body: 'Search for your desired product with many filters',
    color: Colors.white,
  ),
  BoardingModel(
    image: 'assets/svg/reviews.svg',
    title: 'Check Reviews',
    body: 'You can check our customers reviews on each product.',
    color: Colors.white,
  ),
  BoardingModel(
    image: 'assets/svg/easycheckout.svg',
    title: 'Checkout',
    body: 'Nothing easier than selecting your product and checkout easily',
    color: Colors.white,
  ),
  BoardingModel(
    image: 'assets/svg/purchase.svg',
    title: 'Payment',
    body: 'Many Ways to purchase your items easily',
    color: Colors.white,
  ),
];

Color kMainColor = HexColor('B48C1D');
Color kSecondaryColor = HexColor('F8A8A1');

List<ItemModel> homeItems = [
  ItemModel(
    name: 'Al Hakimi',
    desc: 'Cambodian Vip - 1 Tola',
    discount: 30,
    oldPrice: 50.00,
    newPrice: 35.00,
    pic: 'https://markaa'
        '.com/pub/media/catalog/product/cache'
        '/da52021893250d07c9ea5da347e04679/o/r/ori-018089-01.jpg',
    isFav: 0,
  ),
  ItemModel(
    name: 'Al Hakimi',
    desc: 'Mukhallat Perfume - 100ml',
    discount: 40,
    oldPrice: 20.00,
    newPrice: 12.00,
    pic: 'https://markaa'
        '.com/pub/media/catalog/product/cache'
        '/da52021893250d07c9ea5da347e04679/p/z1/Ori-018106-1.jpg',
    isFav: 0,
  ),
  ItemModel(
    name: 'Vince Camuto',
    desc: 'Vince Camuto Flori Lady Set - 3 pcs',
    discount: 30,
    oldPrice: 27.50,
    newPrice: 19.25,
    pic: 'https://627030-2036164-1-raikfcquaxqncofqfm.stackpathdns'
        '.com/pub/media/mf_webp/jpg/media/catalog/product/cache/da52021893250d07c9ea5da347e04679/f/r/fra-018064-1.webp',
    isFav: 0,
  ),
  ItemModel(
    name: 'Al Hakimi',
    desc: 'Indian Munasebat - 3 Tola',
    discount: 28,
    oldPrice: 50.00,
    newPrice: 36.00,
    pic: 'https://markaa'
        '.com/pub/media/catalog/product/cache/da52021893250d07c9ea5da347e04679/p/z1/Ori-018084-1.jpg',
    isFav: 0,
  ),
  ItemModel(
    name: 'Al Hakimi',
    desc: 'Indulgence Smart Oud With A Crustal Stand - 10 Sticks',
    discount: 50,
    oldPrice: 36.00,
    newPrice: 18.00,
    pic: 'https://markaa.com/pub/media/mf_webp/jpeg/media/catalog/product'
        '/cache/da52021893250d07c9ea5da347e04679/a/l/all-024149-2.webp',
    isFav: 0,
  ),
];
