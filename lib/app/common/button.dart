import 'package:flutter/material.dart';

class ButtonAll extends StatefulWidget {
  const ButtonAll({Key? key}) : super(key: key);

  @override
  State<ButtonAll> createState() => _ButtonAllState();
}

class _ButtonAllState extends State<ButtonAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              clipBehavior: Clip.antiAlias,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.orangeAccent),
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size(double.maxFinite, 50)),
                  elevation: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.selected) ? 0 : 10),
                  animationDuration: Duration(milliseconds: 200),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                              color: states.contains(MaterialState.pressed)
                                  ? Colors.transparent
                                  : Colors.white)))),
              onPressed: () {},
              child: Text("Material Button")),
          SizedBox(
            height: 20,
          ),
          RawMaterialButton(
            onPressed: () {},
            child: Text("Raw material Button"),
            fillColor: Colors.redAccent,
            textStyle: TextStyle(color: Colors.white),
            focusColor: Colors.white,
            elevation: 0,
            hoverColor: Colors.purple,
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.resolveWith(
                      (states) => TextStyle(color: Colors.red)),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.purple)),
              child: Text("outline button")),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {},
            child: Text("Material Button"),
            minWidth: 50,
            color: Colors.blue.withOpacity(.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.black87,
            height: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              regularButton(),
              iconOnRight(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              outlinedButton(),
              textButton(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [imageButton(), onlyImage()],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [backColor(), fabbutton()],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              gradientutton(),
              shadowbutton(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

Widget regularButton() {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: const Icon(
      Icons.download,
      size: 24.0,
    ),
    label: const Text('Download'),
  );
}

Widget outlinedButton() {
  return OutlinedButton.icon(
    onPressed: () {},
    icon: const Icon(
      Icons.download,
      size: 24.0,
    ),
    label: const Text('Download'),
  );
}

Widget textButton() {
  return TextButton.icon(
    onPressed: () {},
    icon: const Icon(
      Icons.download,
      size: 24.0,
    ),
    label: const Text('Download'),
  );
}

Widget iconOnRight() {
  return ElevatedButton(
    onPressed: () {},
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Download'), // <-- Text
        SizedBox(
          width: 5,
        ),
        Icon(
          // <-- Icon
          Icons.download,
          size: 24.0,
        ),
      ],
    ),
  );
}

Widget imageButton() {
  return SizedBox.fromSize(
    size: const Size(60, 60),
    child: ClipOval(
      child: Material(
        color: Colors.purpleAccent[100],
        child: InkWell(
          splashColor: selectedColor,
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.download,
                size: 25,
              ),
              Text("Tap"),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget gradientutton() {
  return GestureDetector(
    child: Container(
      width: 160,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.purpleAccent, selectedColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            "Download",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget shadowbutton() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      elevation: 15, // Adjust the elevation value as per your preference
      shadowColor: Colors.black.withOpacity(0.8), // Set the shadow color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "Download",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget fabbutton() {
  return FloatingActionButton.extended(
    onPressed: () {},
    icon: const Icon(Icons.download),
    label: const Text('Download'),
  );
}

Widget backColor() {
  return ElevatedButton.icon(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      backgroundColor: selectedColor, // Set the background color
    ),
    icon:
        const Icon(Icons.download, color: Colors.white), // Set the button icon
    label: const Text(
      'Download',
      style: TextStyle(color: Colors.white),
    ), // Set the button label
  );
}

Widget fullWidth() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // Add your button functionality here
      },
      child: const Text('Download'),
    ),
  );
}

Widget onlyImage() {
  return SizedBox.fromSize(
    size: const Size(60, 60),
    child: ClipOval(
      child: Material(
        color: Colors.purpleAccent[100],
        child: InkWell(
          splashColor: selectedColor,
          onTap: () {},
          child: const Icon(
            Icons.download,
            size: 35,
          ),
        ),
      ),
    ),
  );
}

const selectedColor = Color.fromARGB(255, 231, 63, 63);
