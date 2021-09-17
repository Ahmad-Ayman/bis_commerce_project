import 'package:bis_commerce_project/layout/home_layout/home_cubit/home_cubit.dart';
import 'package:bis_commerce_project/shared/constatns.dart';
import 'package:bis_commerce_project/shared/reusable_components/carousel_item.dart';
import 'package:bis_commerce_project/shared/reusable_components/home_items.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: kMainColor,
            child: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration.collapsed(
                              hintText: 'Search'),
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search))
                    ],
                  ),
                ),
              ),
            ),
          ),
          CarouselItem(
            imagesLinks: HomeCubit.get(context).carouselImmagesLinks,
          ),
          Container(
            color: Colors.white,
            height: 120,
            padding: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => index)
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: e % 2 == 0
                                  ? const NetworkImage('https://i.pinimg'
                                      '.com/originals/66/44/b3/6644b34c91f57f8d40a4eaa94e3cb797.png')
                                  : const NetworkImage(
                                      'https://images.vexels.com/media/users/3/149459/raw/2ccb7690fa79000971540a5b466b25e4-astronaut-space-walk-illustration.jpg'),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Category $e',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage('https://mdbootstrap'
                      '.com/img/Photos/Slides/img%20(130).jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Best Deal',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 30,
                      ),
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: kMainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: kMainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => HomeCardItems(
                model: homeItems[index],
              ),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
