import 'package:daticloud/models/mails.dart';
import 'package:flutter/material.dart';

class DetailsMailPage extends StatefulWidget {
  final int id;
  DetailsMailPage({this.id});
  @override
  _DetailsMailPageState createState() => _DetailsMailPageState();
}

format(String date) {
  DateTime realDate = DateTime.parse(date);
  String month =
      realDate.month < 10 ? '0${realDate.month}' : realDate.month.toString();
  return '${realDate.day}/$month/${realDate.year}';
}

class _DetailsMailPageState extends State<DetailsMailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          child: Column(
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
                            style: Theme.of(context).textTheme.title,
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
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back, color: Colors.blue),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width - 195.0,
                        ),
                        InkWell(
                          child: Container(
                            height: 50.0,
                            width: 40.0,
                            child: Icon(Icons.archive, color: Colors.blue),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              mails.remove(mails.elementAt(widget.id));
                            });
                            Navigator.pushNamed(context, '/');
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
              Divider(
                //thickness: 2.0,
              )
            ],
          ),
          preferredSize: Size.fromHeight(75),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: mails[widget.id].color,
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Center(
                        child: mails[widget.id].image == null
                            ? Text(
                                '${mails[widget.id].title.substring(0, 1)}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.bold),
                              )
                            : ClipOval(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.asset(
                                    'images/${mails[widget.id].image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(mails[widget.id].title,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            format(mails[widget.id].date),
                            style: TextStyle(fontSize: 10.0),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'a moi',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 17.0,
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      child: Icon(Icons.subdirectory_arrow_left),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      child: Icon(Icons.subdirectory_arrow_right),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    mails[widget.id].content,
                    textAlign: TextAlign.justify,
                  )),
              SizedBox(
                height: 10.0,
              ),
              Text('Auteur: Milla'),
              Text('Email: grose.milla16@hotmail.com'),
              Text('URL: '),
              Text('Commentaire: '),
              Text(
                  'Sick of waisting money on PPC advertising that just doesn\'t deliver? Now you can post your ad on thousands of ad websites and it\'ll cost you less than \$40. Get unlimited traffic forever! For more information just visit: http://www.instantadsposted.tech'),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  OutlineButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.subdirectory_arrow_left),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text('Repondre'),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  OutlineButton(
                    color: Colors.blue,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.subdirectory_arrow_right),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text('Transferer'),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
