import 'package:daticloud/screens/home.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final int index;
  CustomDrawer({@required this.index});
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 5.0),
        child: Text(
          'Datimail',
          style: TextStyle(
              color: Color(0xff1685d7),
              fontWeight: FontWeight.bold,
              fontSize: 25.0),
        ),
      ),
      Divider(),
      Container(
        height: 220,
        child: ListView.builder(
          padding: EdgeInsets.all(0.0),
          itemBuilder: (BuildContext context, index) {
            return Hero(
              tag: 'tag$index',
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => items[index].page));
                },
                child: Container(
                  color: index == widget.index
                      ? Color(0xfffce8e7)
                      : Colors.transparent,
                  child: ListTile(
                    leading: Icon(
                      items[index].icon,
                      color: index == widget.index
                          ? Color(0xff2d6db4)
                          : Colors.blueGrey,
                    ),
                    title: Text(
                      items[index].name,
                      style: TextStyle(
                          fontSize: index == widget.index ? 16.0 : 15.0,
                          color: index == widget.index
                              ? Color(0xff1685d7)
                              : Colors.blueGrey),
                    ),
                    trailing: items[index].number == null
                        ? items[index].news == null
                            ? Text('')
                            : Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff306cb5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3.0, horizontal: 5.0),
                                  child: Text(
                                    '${items[index].news} nouv.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                        : Text(
                            '${items[index].number}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: index == widget.index
                                    ? Color(0xff1685d7)
                                    : Colors.blueGrey),
                          ),
                  ),
                ),
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
      ListTile(
        title: Text(
          'TOUS LES LIBELLES',
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      Container(
        height: 235,
        child: ListView.builder(
          padding: EdgeInsets.all(0.0),
          itemBuilder: (BuildContext context, index) {
            return Hero(
              tag: 'tag${index + 4}',
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => labels[index].page));
                },
                child: Container(
                  color: index + 4 == widget.index
                      ? Color(0xfffce8e7)
                      : Colors.transparent,
                  child: ListTile(
                    leading: Icon(
                      labels[index].icon,
                      color: index + 4 == widget.index
                          ? Color(0xff2d6db4)
                          : Colors.blueGrey,
                    ),
                    title: Text(
                      labels[index].name,
                      style: TextStyle(
                          fontSize: index + 4 == widget.index ? 16.0 : 15.0,
                          color: index + 4 == widget.index
                              ? Color(0xff1685d7)
                              : Colors.blueGrey),
                    ),
                    trailing: Text(
                      '${labels[index].number ?? ''}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: index + 4 == widget.index
                              ? Color(0xff1685d7)
                              : Colors.blueGrey),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: labels.length,
        ),
      ),
    ]));
  }
}

class DrawerItem {
  final String name;
  final IconData icon;
  final Widget page;
  final int number;
  final int news;
  DrawerItem({this.name, this.icon, this.page, this.number, this.news});
}

List<DrawerItem> items = [
  DrawerItem(
      name: 'Principale',
      icon: Icons.dashboard,
      page: HomePage(
        title: 'principale',
      ),
      number: 63),
  DrawerItem(
      name: 'Reseaux sociaux',
      icon: Icons.supervisor_account,
      page: HomePage(
        title: 'Reseaux sociaux',
      )),
  DrawerItem(
      name: 'Promotions',
      icon: Icons.attachment,
      page: HomePage(
        title: 'Promotions',
      ),
      news: 8),
  DrawerItem(
      name: 'Mises a jour',
      icon: Icons.info,
      page: HomePage(
        title: 'Mises a jour',
      ),
      news: 1),
];

List<DrawerItem> labels = [
  DrawerItem(
      name: 'Messages suivis',
      icon: Icons.star_border,
      page: HomePage(
        title: 'Messages suivis',
      ),
      number: 1),
  DrawerItem(
      name: 'En attente',
      icon: Icons.style,
      page: HomePage(
        title: 'En Attente',
      )),
  DrawerItem(
      name: 'Importants',
      icon: Icons.account_circle,
      page: HomePage(
        title: 'Importants',
      ),
      number: 32),
];
