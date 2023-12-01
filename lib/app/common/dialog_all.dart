import 'package:flutter/material.dart';

class DialofAll extends StatefulWidget {
  const DialofAll({Key? key}) : super(key: key);

  @override
  State<DialofAll> createState() => _DialofAllState();
}

class _DialofAllState extends State<DialofAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                alertDialog(context);
              },
              child: Text("alert dialog")),
          OutlinedButton(
              onPressed: () {
                simpleDialog(context);
              },
              child: Text("Simple Dialog")),
          InkWell(
            onTap: () {
              customDialog(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              constraints: BoxConstraints(maxHeight: 50, maxWidth: 200),
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text("Custom dialog"),
            ),
          ),
          OutlinedButton(
              onPressed: () {
                versionDialog(context);
              },
              child: Text("version Dialog"))
        ],
      ),
    );
  }
}

versionDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AlertDialog(
          title: Text("New Version Are Avaliable V-2.3.0 "),
          content: Text(
              "Can you get better experience so you can download the new version.\nclick to update"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Update")),
          ],
        ),
      );
    },
  );
}

customDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Cool',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Awesome',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 50.0)),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Got It!',
                      style: TextStyle(color: Colors.purple, fontSize: 18.0),
                    )),
              ],
            ),
          ));
}

simpleDialog(BuildContext context) {
  print("Sd");
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text("Simple Dialog"),
      children: [
        Icon(Icons.downhill_skiing),
        Text("simple dialog inside show"),
        SimpleDialogOption(
          child: Text(" Press to pop"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      contentPadding: EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
    ),
  );
}

alertDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.white,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        icon: Icon(Icons.add_alert),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.black87,
              width: 1.5,
            )),
        title: Text("Alert Dialog"),
        content: Text(
            "it is about update the version in your app to enjoy latest functionality "),
        actions: [
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("POP"))
        ],
      );
    },
  );
}
