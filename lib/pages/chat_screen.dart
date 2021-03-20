import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:permission_handler/permission_handler.dart';

import 'call_page.dart';

class ChatScreen extends StatefulWidget {
  String channelName;
  var user;
  ChatScreen(this.channelName);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String messagetext;

  void getUser() async {
    try {
      final userId = _auth.currentUser.uid;
      if (userId != null) {
        DocumentSnapshot loggedinuser =
            await _firestore.collection('userData').doc(userId).get();
        widget.user = loggedinuser.data();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Future<void> onJoin() async {
    // update input validation
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    await _handleCameraAndMic(Permission.storage);
    // push video page with given channel name
    await _firestore
        .collection('servers')
        .doc(widget.channelName)
        .collection('CallNotification')
        .doc(widget.user["name"])
        .set({
      'User': _auth.currentUser.uid,
    });
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(widget.user["name"], widget.channelName),
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
  // void getMessage() async {
  //   await for (var snapshot
  //       in _firestore.collection("servers/${widget.channelName}").snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final texteditingcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                //Implement logout functionality
                onJoin();
              }),
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('servers')
                    .doc(widget.channelName)
                    .collection('messages')
                    .orderBy('timestamp')
                    .snapshots(), // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var message = snapshot.data.docs.reversed;
                    List<MessageBubbles> messageWidget = [];
                    for (var message in message) {
                      final messagetext = message.data()['text'];
                      final messagesender = message.data()['sender'];
                      final messagewidget = MessageBubbles(messagesender,
                          messagetext, widget.user["name"] == messagesender);
                      messageWidget.add(messagewidget);
                    }
                    return Expanded(
                      child: ListView(
                        reverse: true,
                        children: messageWidget,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }
                }),
            StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('servers')
                    .doc(widget.channelName)
                    .collection('callNotification')
                    .snapshots(), // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //widget to notify other user that his connection is on the call
                    return Container();
                  } else {
                    // return nothing
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }
                }),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: texteditingcontroller,
                      onChanged: (value) {
                        messagetext = value;
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      texteditingcontroller.clear();
                      var status = _firestore
                          .collection('servers')
                          .doc(widget.channelName)
                          .collection('messages')
                          .add({
                        'text': messagetext,
                        'sender': widget.user["name"],
                        'timestamp': DateTime.now().millisecondsSinceEpoch
                      });
                      if (status != null) {
                        print("sucess");
                      } else {
                        print("failed");
                      }
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubbles extends StatelessWidget {
  final String messagetext;
  final String messagesender;
  bool isme;
  MessageBubbles(this.messagesender, this.messagetext, this.isme);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment:
              isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              '$messagesender',
              style: TextStyle(fontSize: 12.0, color: Colors.black54),
            ),
            Material(
              borderRadius: BorderRadius.circular(30.0),
              elevation: 5.0,
              color: isme ? Colors.blue : Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  '$messagetext',
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
            ),
          ]),
    );
  }
}
