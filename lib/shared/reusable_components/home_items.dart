import 'package:bis_commerce_project/layout/home_layout/home_cubit/home_cubit.dart';
import 'package:bis_commerce_project/models/items_model.dart';
import 'package:bis_commerce_project/modules/item_details/item_details_screen.dart';
import 'package:bis_commerce_project/shared/constatns.dart';
import 'package:flutter/material.dart';

class HomeCardItems extends StatefulWidget {
  ItemModel model;
  HomeCardItems({required this.model});

  @override
  State<HomeCardItems> createState() => _HomeCardItemsState();
}

class _HomeCardItemsState extends State<HomeCardItems> {
  var isFav = false;
  void switchFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        kNavigateTo(
          context,
          ItemDetailsScreen(
            model: widget.model,
            isFav: isFav,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image(
                      image: NetworkImage('${widget.model.pic}'),
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          switchFav();
                        });
                      },
                      icon: Icon(
                        Icons.favorite_outline_rounded,
                        color: isFav ? Colors.red : Colors.black,
                      ),
                      iconSize: 30,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${widget.model.discount}% OFF',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '${widget.model.name}',
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Text(
                  '${widget.model.desc}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Divider(
                  color: Colors.grey[500],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                child: Row(
                  children: [
                    Text(
                      '${widget.model.newPrice} KD',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${widget.model.oldPrice} KD',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 14.0,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.redAccent,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        print('Hello');
                      },
                      child: CircleAvatar(
                        backgroundColor: kMainColor,
                        child: const Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
