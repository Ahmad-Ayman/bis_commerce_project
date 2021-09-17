import 'package:bis_commerce_project/layout/home_layout/home_cubit/home_cubit.dart';
import 'package:bis_commerce_project/layout/home_layout/home_cubit/home_states.dart';
import 'package:bis_commerce_project/shared/constatns.dart';
import 'package:bis_commerce_project/shared/reusable_components/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kMainColor,
            title: Image.asset(
              'assets/png/logo.png',
              width: 200,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_basket),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Text(
                            '0',
                            style: TextStyle(
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
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded),
                label: 'Brands',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'My Account',
              ),
            ],
            currentIndex: cubit.currentIndexBottomNavBar,
            onTap: (index) {
              cubit.changeSelectedBottomNavBarItem(index, context);
            },
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  height: 250,
                  color: kMainColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://lh3.googleusercontent.com/proxy/o1LHGhOq-ImnX50BVLc_uKJ0_QCkuin3G8Zq80VlMlbLfIKRvaEpHKhv_3djrDjqv1ebo-NODHSD4TOdMwRF0K-OxYD1l7aTIGyZbvnWfM3EGnqwCep_',
                          ),
                        ),
                        title: Text(
                          'Hello Guest',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.login,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ToggleSwitch(
                              minWidth: 80.0,
                              minHeight: 30.0,
                              fontSize: 12.0,
                              initialLabelIndex: 0,
                              activeBgColor: [kSecondaryColor],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.white,
                              inactiveFgColor: Colors.grey[900],
                              totalSwitches: 2,
                              labels: ['English', 'العربية'],
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    itemCount: cubit.screenTitles.length,
                    itemBuilder: (context, index) {
                      print(cubit.screenTitles[0]);
                      return DrawerItem(
                        prefix: cubit.drawerItemsIcons[index],
                        title: cubit.screenTitles[index],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    title: Text('Terms and Conditions'),
                    leading: Icon(Icons.shield),
                  ),
                )
              ],
            ),
          ),
          body: cubit.screensForBottomNavBar[cubit.currentIndexBottomNavBar],
        );
      },
    );
  }
}
