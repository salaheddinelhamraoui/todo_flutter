import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Container drawerList(BuildContext context) {
  TextStyle _textStyle = TextStyle(
    fontFamily: "Janna",
    color: Colors.white,
    fontSize: 25.0,
  );
  ListTile listTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      title: Text(
        text,
        style: _textStyle,
      ),
      onTap: () {},
    );
  }

  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff0abde3), Color(0xff2e86de)],
      ),
    ),
//    color: Theme.of(context).primaryColor,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Text(
              'الأقسام',
              style: TextStyle(
                  fontFamily: "Janna",
                  color: Colors.white,
                  fontSize: 27.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        listTile(Icons.home, 'المنزل'),
        listTile(Icons.local_library, 'الدراسة'),
        listTile(Icons.work, 'العمل'),
        listTile(Icons.shopping_basket, 'مقتنيات'),
        listTile(Icons.insert_emoticon, 'ترفيه'),
        listTile(FontAwesomeIcons.globe, 'منوع'),
      ],
    ),
  );
}
