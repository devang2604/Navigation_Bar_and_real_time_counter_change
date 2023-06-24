import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class _HomeScreenState extends State<HomeScreen> {
  int cartNumber = 0;
  int notificationNumber = 0;
  int favouriteNumber = 0;

  void incrementCartNumber() {
    setState(() {
      cartNumber++;
    });
  }

  void decrementCartNumber() {
    setState(() {
      if (cartNumber > 0) {
        cartNumber--;
      }
    });
  }

  void incrementNotificationNumber() {
    setState(() {
      notificationNumber++;
    });
  }

  void decrementNotificationNumber() {
    setState(() {
      if (notificationNumber > 0) {
        notificationNumber--;
      }
    });
  }

  void incrementFavouriteNumber() {
    setState(() {
      favouriteNumber++;
    });
  }

  void decrementFavouriteNumber() {
    setState(() {
      if (favouriteNumber > 0) {
        favouriteNumber--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<Widget> _buildScreens() {
    return [
      Screen1(),
      Screen2(),
      Screen3(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: badges.Badge(
          badgeContent: Text(
            cartNumber.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.shopping_cart),
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: badges.Badge(
          badgeContent: Text(
            notificationNumber.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.notifications),
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: badges.Badge(
          badgeContent: Text(
            favouriteNumber.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(
            CupertinoIcons.heart_fill,
            color: Colors.grey,
          ),
        ),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  Widget Screen1() {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('CART'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: incrementCartNumber,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: decrementCartNumber,
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }

  Widget Screen2() {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('NOTIFICATIONS'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: incrementNotificationNumber,
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: decrementNotificationNumber,
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }

  Widget Screen3() {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('FAVOURITES'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: incrementFavouriteNumber,
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: decrementFavouriteNumber,
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
