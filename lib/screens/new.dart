import 'package:daticloud/screens/home.dart';
import 'package:flutter/material.dart';

class NewMailPage extends StatefulWidget {
  @override
  _NewMailPageState createState() => _NewMailPageState();
}

class _NewMailPageState extends State<NewMailPage> {
  final _senderController =
      new TextEditingController(text: 'bayiha36@gmail.com');
  final _receiverController = new TextEditingController();
  final _subjectController = new TextEditingController();
  final _contentController = new TextEditingController();

  final _senderNode = new FocusNode();
  final _receiverNode = new FocusNode();
  final _subjectNode = new FocusNode();
  final _contentNode = new FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: Colors.blue,
        title: Text(
          'Nouveau message',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.attach_file),
            ),
          ),
          InkWell(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushNamed(context, '/');
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.send),
              )),
          InkWell(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.more_vert),
          ))
        ],
      ),
      body: SafeArea(
        top: true,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: _senderController,
                  focusNode: _senderNode,
                  onFieldSubmitted: (_) {
                    _senderNode.unfocus();
                    FocusScope.of(context).requestFocus(_receiverNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Renseigner l\'adresse de l\'emetteur';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixText: 'De: ',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  autofocus: true,
                  controller: _receiverController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  focusNode: _receiverNode,
                  onFieldSubmitted: (_) {
                    _receiverNode.unfocus();
                    FocusScope.of(context).requestFocus(_subjectNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Renseigner l\'adresse du recepteur';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixText: 'A: ',
                      suffixIcon: Icon(Icons.keyboard_arrow_down)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _subjectController,
                  focusNode: _subjectNode,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (term) {
                    _subjectNode.unfocus();
                    FocusScope.of(context).requestFocus(_contentNode);
                  },
                  decoration: InputDecoration(
                    hintText: 'Objet',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _contentController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  focusNode: _contentNode,
                  onFieldSubmitted: (term) {
                    if (_formKey.currentState.validate()) {
                      _contentNode.unfocus();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage(title: 'principale',)));
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Redigez votre message',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
