import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbars extends StatefulWidget {
  const BottomNavbars({super.key});

  @override
  State<BottomNavbars> createState() => _BottomNavbarsState();
}

class _BottomNavbarsState extends State<BottomNavbars> {
  int currentindex = 0;
  void change(int v) {
    setState(() {
      currentindex = v;
    });
  }

  final GlobalKey<CurvedNavigationBarState> curveNavigationKey =
      GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom navigation bar"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Text("BottomNavigationBar"),
          SizedBox(
            height: 20,
          ),
          BottomNavigationBar(
            currentIndex: currentindex,
            onTap: change,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: "category"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_rounded), label: "account"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "setting"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(40),
            //   color: Colors.purple,
            // ),
            // color: Colors.purple,
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(40),
              child: BottomNavigationBar(
                // backgroundColor: Colors.orangeAccent,
                // type: BottomNavigationBarType.fixed,
                currentIndex: currentindex,
                onTap: change,
                selectedItemColor: Colors.redAccent,
                unselectedItemColor: Colors.black87,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category_outlined), label: "category"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "search"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_rounded), label: "account"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "setting"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("NavigationBar"),
          SizedBox(
            height: 20,
          ),
          NavigationBar(
              height: 50,
              selectedIndex: currentindex,
              onDestinationSelected: change,
              elevation: 2,
              backgroundColor: Colors.white,
              indicatorColor: Colors.purple.withOpacity(.3),
              indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.purple)),
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(
                    icon: Icon(Icons.category_outlined), label: "category"),
                NavigationDestination(
                    icon: Icon(Icons.search), label: "search"),
                NavigationDestination(
                    icon: Icon(Icons.person_outline_outlined),
                    label: "profile"),
                NavigationDestination(
                    icon: Icon(Icons.settings), label: "setting"),
              ]),
          SizedBox(
            height: 20,
          ),
          Text(
              "container h-55 inside row of column inside animation container and icon"),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.black87),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => change(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: Duration(milliseconds: 200),
                        width: currentindex == 0 ? 20 : 0,
                        height: 3,
                      ),
                      Icon(
                        Icons.home,
                        color:
                            currentindex == 0 ? Colors.deepPurple : Colors.grey,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => change(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: Duration(milliseconds: 200),
                        width: currentindex == 1 ? 20 : 0,
                        height: 3,
                      ),
                      Icon(
                        Icons.category_outlined,
                        color:
                            currentindex == 1 ? Colors.deepPurple : Colors.grey,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => change(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: Duration(milliseconds: 200),
                        width: currentindex == 2 ? 20 : 0,
                        height: 3,
                      ),
                      Icon(
                        Icons.search,
                        color:
                            currentindex == 2 ? Colors.deepPurple : Colors.grey,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => change(3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: Duration(milliseconds: 200),
                        width: currentindex == 3 ? 20 : 0,
                        height: 3,
                      ),
                      Icon(
                        Icons.person_outline_outlined,
                        color:
                            currentindex == 3 ? Colors.deepPurple : Colors.grey,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => change(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: Duration(milliseconds: 200),
                        width: currentindex == 4 ? 20 : 0,
                        height: 3,
                      ),
                      Icon(
                        Icons.settings,
                        color:
                            currentindex == 4 ? Colors.deepPurple : Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("google_nav_bar: ^5.0.6"),
          SizedBox(
            height: 20,
          ),
          GNav(

              ///chagekarvanu
              backgroundColor: Colors.black87,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.purple.shade200,
              padding: EdgeInsets.all(16), //for controll the height

              ///
              gap: 8,
              onTabChange: change,
              selectedIndex: currentindex,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.category,
                  text: 'category',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.person_outline_outlined,
                  text: 'Profile',
                ),
              ]),
          Divider(
            color: Colors.black87,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Text("flutter_snake_navigationbar: ^0.6.1"),
          SizedBox(
            height: 20,
          ),
          SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.indicator,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(48)),
            ),
            backgroundColor: Colors.black87,
            snakeViewColor: Colors.black87,
            height: 68,
            elevation: 4,
            selectedItemColor: SnakeShape.circle == SnakeShape.indicator
                ? Colors.black87
                : null,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
            showUnselectedLabels: false,
            showSelectedLabels: true,
            currentIndex: currentindex,
            onTap: change,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  // ImageIcon(
                  //   AssetImage("assets/navbar_icons/home.png"),
                  //   color: Colors.white,
                  //   size: 26,
                  // ),
                  activeIcon: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      maxRadius: 4,
                    ),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_outlined,
                    color: Colors.white,
                  ),
                  // ImageIcon(
                  //   AssetImage("assets/navbar_icons/categories.png"),
                  //   color: Colors.white,
                  //   size: 26,
                  // ),
                  activeIcon: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      maxRadius: 4,
                    ),
                  ),
                  label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  // ImageIcon(
                  //   AssetImage("assets/navbar_icons/shopping-cart.png"),
                  //   color: Colors.white,
                  //   size: 26,
                  // ),
                  activeIcon: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      maxRadius: 4,
                    ),
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  // ImageIcon(
                  //   AssetImage("assets/navbar_icons/user.png"),
                  //   color: Colors.white,
                  //   size: 26,
                  // ),
                  activeIcon: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      maxRadius: 4,
                    ),
                  ),
                  label: 'Other'),
              // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
            ],
          ),
          Divider(
            color: Colors.black87,
            thickness: 2,
          ),
          Text("curved_navigation_bar: ^1.0.3"),
          SizedBox(
            height: 20,
          ),
          CurvedNavigationBar(
            key: curveNavigationKey,
            backgroundColor:
                Colors.transparent, //curve pade tya color ap vo hoy to
            buttonBackgroundColor: Colors.purple,

            ///
            height: 60,
            animationCurve: Curves.easeOut,
            animationDuration: Duration(milliseconds: 300),
            color: Colors.lightBlue,
            index: currentindex,
            onTap: change,
            items: [
              Icon(
                Icons.home,
                size: 30,
              ),
              Icon(
                Icons.category_outlined,
                size: 30,
              ),
              Icon(
                Icons.search,
                size: 30,
              ),
              Icon(
                Icons.person_outline_outlined,
                size: 30,
              ),
              Icon(
                Icons.settings,
                size: 30,
              ),
            ],
          ),
          Divider(
            color: Colors.black87,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          ImageIcon(AssetImage('assets/icons/insta.gif')),
          SizedBox(
            height: 50,
          ),
          Text("floating action button ,center kari ne ")
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    change(0);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: currentindex == 0 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "home",
                        style: TextStyle(
                            color:
                                currentindex == 0 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    change(1);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: currentindex == 1 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "home",
                        style: TextStyle(
                            color:
                                currentindex == 1 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    change(3);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: currentindex == 3 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "home",
                        style: TextStyle(
                            color:
                                currentindex == 3 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    change(4);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: currentindex == 4 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "home",
                        style: TextStyle(
                            color:
                                currentindex == 4 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => change(2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/icons/insta.gif",
                  // color: currentindex == 2 ? Colors.blue : Colors.grey,
                  width: 50,
                  height: 50,
                )
                /* ImageIcon(
                AssetImage("assets/images/a1.png"),
                size: 40,
                // color: currentindex == 2 ? Colors.blue : Colors.grey,
              ),*/
                ),
            // FloatingActionButton(
            //   backgroundColor: currentindex == 2 ? Colors.blue : Colors.grey,
            //   elevation: 1,
            //   onPressed: () {
            //     change(2);
            //   },
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(100),
            //       side: BorderSide(color: Colors.white, width: 3)),
            //   child: Icon(Icons.aspect_ratio),
            // ),
            // SizedBox(
            //   height: 1,
            // ),
            Text(
              "Search",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: currentindex == 2 ? Colors.blue : Colors.grey),
            ),
            SizedBox(
              height: 6,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
