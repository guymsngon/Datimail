import 'package:daticloud/common/drawer.dart';
import 'package:daticloud/common/style.dart';
import 'package:daticloud/models/mails.dart';
import 'package:daticloud/screens/new.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({@required this.title}) : assert(title != null);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ignoreIndications = false;

  String format(DateTime date) {
    return '${date.day} ${months[date.month - 1]}';
  }

  var months = [
    'Janv.',
    'Fevr.',
    'Mars',
    'Avr.',
    'Mai',
    'Juin',
    'Juil.',
    'Aout',
    'Sept.',
    'Oct.',
    'Nov',
    'Dec'
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool subOptionMode = false;
  int idOfItemLongPress;
  bool dropDownMenuOpen = false;

  void updateSubOptionMode(bool modeOption) {
    setState(() {
      subOptionMode = modeOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (subOptionMode) {
          setState(() {
            updateSubOptionMode(false);
          });
          return false;
        }
        return true;
      },
      child: SafeArea(
        top: true,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(
            index: 0,
          ),
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewMailPage()));
            },
            child: Icon(
              Icons.add,
              size: 40.0,
              color: Color(0xff2f6eb3),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        subOptionMode == true
                            ? Column(
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: DropdownButtonHideUnderline(
                                              child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButton<String>(
                                                icon: Icon(
                                                  Icons.more_vert,
                                                  color: Colors.blue,
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .title,
                                                items: [
                                                  'Deplacer vers',
                                                  'Mettre en attente',
                                                  'Changer de libelle',
                                                  'Activer le suivi',
                                                  'Marquer comme non important',
                                                  'Ignorer',
                                                  'Signaler comme spam'
                                                ].map((String value) {
                                                  return DropdownMenuItem(
                                                    child: new Text(value),
                                                    value: value,
                                                  );
                                                }).toList(),
                                                onChanged: (value) {}),
                                          )),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              width: 50.0,
                                              color: Colors.transparent,
                                              height: 50.0,
                                              child: IconButton(
                                                onPressed: () =>
                                                    updateSubOptionMode(false),
                                                icon: Icon(Icons.arrow_back,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              color: Colors.transparent,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50.0,
                                              color: Colors.transparent,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  266.0,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                updateSubOptionMode(false);
                                              },
                                              child: Container(
                                                height: 50.0,
                                                width: 40.0,
                                                child: Icon(Icons.archive,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  mails.remove(mails.elementAt(
                                                      idOfItemLongPress));
                                                });
                                                updateSubOptionMode(false);
                                              },
                                              child: Container(
                                                height: 50.0,
                                                width: 40.0,
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                updateSubOptionMode(false);
                                              },
                                              child: Container(
                                                height: 50.0,
                                                width: 40.0,
                                                child: Icon(
                                                  Icons.mail_outline,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider()
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    child: Material(
                                      elevation: 20.0,
                                      shadowColor: Colors.blueGrey,
                                      child: Stack(
                                        children: <Widget>[
                                          TextFormField(
                                              decoration: InputDecoration(
                                            hintText: 'Rech. dans message',
                                            prefixIcon: Icon(Icons.menu),
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6.0,
                                                      horizontal: 12.0),
                                              child: Container(
                                                height: 40.0,
                                                width: 40.0,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    'images/user.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xffe0e0e0))),
                                          )),
                                          Row(
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () => _scaffoldKey
                                                    .currentState
                                                    .openDrawer(),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .12,
                                                  height: 50.0,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .32,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                title: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              ClipOval(
                                                                            child:
                                                                                Image.asset(
                                                                              'images/user.jpg',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10.0,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * .4,
                                                                              child: Text(
                                                                                'Ngon Guy Martin',
                                                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * .4,
                                                                              child: Text('ngonguy@gmail.com', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0)),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10.0,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Spacer(),
                                                                        Container(
                                                                          width:
                                                                              28.0,
                                                                          child:
                                                                              Image.asset('images/logo.png'),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    OutlineButton(
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Container(
                                                                        child: Text(
                                                                            'Gerer votre compte Datimail'),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10.0,
                                                                    ),
                                                                    Divider(),
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons
                                                                              .person_add),
                                                                      title: Text(
                                                                          'Ajouter un compte'),
                                                                    ),
                                                                    ListTile(
                                                                      leading: Icon(
                                                                          Icons
                                                                              .settings_remote),
                                                                      title: Text(
                                                                          'Gerer les comptes sur cet appareil'),
                                                                    ),
                                                                    Divider(),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        'Regles de confidentialite',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15.0,
                                                                            color:
                                                                                Colors.blueAccent),
                                                                      ),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        'Conditions d\'utilisation',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.blueAccent,
                                                                            fontSize: 15.0),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .135,
                                                  height: 50.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                        Text('${widget.title.toUpperCase()}'),
                        SizedBox(
                          height: 10.0,
                        ),
                        ignoreIndications == true
                            ? SizedBox(
                                height: 0.0,
                              )
                            : Row(
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          .15,
                                      child: Icon(Icons.markunread)),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .7 -
                                            30.0,
                                    child: Text(
                                      'Appuyer sur l\'image d\'un expediteur pour  selectionner la conversation correspondante.',
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        ignoreIndications = true;
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .15,
                                      child: Text(
                                        'Ignorer',
                                        style: TextStyle(
                                            color: themeData.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                        ignoreIndications == true
                            ? SizedBox(
                                height: 0.0,
                              )
                            : SizedBox(
                                height: 5.0,
                              ),
                        ignoreIndications == true
                            ? SizedBox(
                                height: 0.0,
                              )
                            : Divider(
                                color: Colors.blueGrey,
                              ),
                      ],
                    ),
                  ),
                  Column(
                    children: mails.map<Widget>((mail) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsMailPage(id: mail.id))),
                        onLongPress: () {
                          setState(() {
                            idOfItemLongPress = mail.id;
                          });
                          updateSubOptionMode(true);
                        },
                        child: Container(
                          color: subOptionMode && mail.id == idOfItemLongPress
                              ? Colors.blue.withOpacity(.2)
                              : Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: subOptionMode &&
                                              mail.id == idOfItemLongPress
                                          ? Colors.blue
                                          : mail.color,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  child: Center(
                                      child: mail.id == idOfItemLongPress &&
                                              subOptionMode
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            )
                                          : mail.image == null
                                              ? Text(
                                                  '${mail.title.substring(0, 1)}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 27.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : ClipOval(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: Image.asset(
                                                      'images/${mail.image}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 110.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '${mail.title}',
                                            style: TextStyle(
                                                fontWeight: /* mail.alreadyRead */ true ==
                                                        true
                                                    ? FontWeight.normal
                                                    : FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            '${mail.numberOfMail ?? ''}',
                                            style: TextStyle(fontSize: 12.0),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            /* mail.isDraft */ true == true
                                                ? 'brouillon'
                                                : '',
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      mail.subtitle == null
                                          ? SizedBox(
                                              height: 0.0,
                                            )
                                          : Text(
                                              mail.subtitle.length > 20
                                                  ? '${mail.subtitle.substring(0, 20)}...'
                                                  : mail.subtitle,
                                              style: TextStyle(
                                                  fontWeight: true == true
                                                      ? FontWeight.normal
                                                      : FontWeight.bold),
                                            ),
                                      Text(mail.content.length > 35
                                          ? '${mail.content.substring(0, 35)}...'
                                          : mail.content),
                                      mail.joinPieces == null
                                          ? SizedBox(
                                              height: 0.0,
                                            )
                                          : Container(
                                              height: 20.0,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      mail.joinPieces.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0)),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black)),
                                                        width: 130.0,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 3.0,
                                                                  horizontal:
                                                                      5.0),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: <Widget>[
                                                              Icon(
                                                                mail.joinPieces[index].type ==
                                                                        'file'
                                                                    ? Icons
                                                                        .insert_drive_file
                                                                    : mail.joinPieces[index].type ==
                                                                            'video'
                                                                        ? Icons
                                                                            .videocam
                                                                        : Icons
                                                                            .audiotrack,
                                                                size: 12.0,
                                                              ),
                                                              SizedBox(
                                                                width: 2.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            1.0),
                                                                child: Text(
                                                                  mail.joinPieces[index].name.length >
                                                                          20
                                                                      ? '${mail.joinPieces[index].name.substring(0, 20)}...'
                                                                      : mail
                                                                          .joinPieces[
                                                                              index]
                                                                          .name,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 40.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        format(DateTime.parse(mail.date)),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.5),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          /* mail.isFavorite = !mail.isFavorite; */
                                        },
                                        child: Icon(
                                          /* mail.isFavorite */ true == true
                                              ? Icons.star_border
                                              : Icons.star,
                                          size: 22.0,
                                          color: /* mail.isFavorite */ true ==
                                                  true
                                              ? Colors.blueGrey
                                              : Colors.orange,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
