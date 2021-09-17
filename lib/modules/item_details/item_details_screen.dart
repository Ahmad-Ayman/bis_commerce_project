import 'package:bis_commerce_project/models/items_model.dart';
import 'package:bis_commerce_project/shared/constatns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ItemDetailsScreen extends StatefulWidget {
  ItemModel model;
  bool isFav;
  ItemDetailsScreen({required this.model, required this.isFav});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final TextEditingController _searchController = TextEditingController();
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: kMainColor, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration:
                      const InputDecoration.collapsed(hintText: 'Search'),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image(
                  image: NetworkImage('${widget.model.pic}'),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 30,
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        '${widget.model.discount}%',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Icon(
                          Icons.favorite_outline_rounded,
                          size: 40,
                          color: widget.isFav ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${widget.model.name}',
                    style: TextStyle(
                      fontSize: 18,
                      color: kMainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${widget.model.oldPrice} KD',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 14.0,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.redAccent,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${widget.model.newPrice} KD',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: Text(
              '${widget.model.desc}',
              maxLines: 2,
              style: const TextStyle(
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: Row(
              children: [
                Text(
                  'SKU. Ori-018086',
                  style: TextStyle(
                    fontSize: 13,
                    color: kMainColor,
                  ),
                ),
                Spacer(),
                const Text(
                  'IN STOCK',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            color: Colors.grey[400],
            thickness: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: Center(
              child: RatingStars(
                value: value,
                onValueChanged: (v) {
                  setState(() {
                    value = v;
                  });
                },
                starBuilder: (index, color) => Icon(
                  Icons.star,
                  color: color,
                ),
                starCount: 5,
                starSize: 40,
                valueLabelColor: const Color(0xff9b9b9b),
                valueLabelTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0),
                valueLabelRadius: 10,
                maxValue: 5,
                starSpacing: 0.5,
                maxValueVisibility: true,
                valueLabelVisibility: true,
                animationDuration: Duration(milliseconds: 500),
                valueLabelPadding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                valueLabelMargin: const EdgeInsets.only(right: 8),
                starOffColor: const Color(0xffe7e8ea),
                starColor: kMainColor,
              ),
            ),
          ),
          Divider(
            height: 10,
            color: Colors.grey[400],
            thickness: 8,
          ),
          Spacer(),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print('Buy Now');
                    },
                    child: Container(
                      height: 100,
                      color: kMainColor,
                      child: const Center(
                        child: Text(
                          'BUY NOW',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print('Added to Cart');
                  },
                  child: Container(
                    width: 70,
                    height: 100,
                    color: Colors.grey,
                    child: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
