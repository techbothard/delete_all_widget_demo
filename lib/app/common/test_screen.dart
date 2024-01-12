import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final GlobalKey<FormState> fk = GlobalKey<FormState>();
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test_screen"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fk,
          onChanged: () {},
          child: Column(
            children: [
              TextInputFlds(
                controller: TextEditingController(),
                hintText: "Email",
                validation: (p0) {
                  if (p0!.isEmpty) {
                    return "Asd";
                  }
                  return null;
                },
                focusNode: FocusNode(),
              ),
              SizedBox(
                height: 20,
              ),
              TextInputFlds(
                controller: TextEditingController(),
                hintText: "password",
                validation: (p0) {
                  if (p0!.isEmpty) {
                    return "Asd";
                  }
                  return null;
                },
                focusNode: FocusNode(),
                keyBoardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                child: Stack(
                  children: [
                    IgnorePointer(
                      ignoring: isLoading,
                      child: GestureDetector(
                        onTap: () {
                          print("ASd");
                        },
                        child: Container(
                          color: Colors.orange,
                          height: 90,
                          width: 250,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLoading,
                      child: Container(
                        alignment: Alignment.center,
                        color: const Color(0x80000000),
                        child: CupertinoActivityIndicator(
                          radius: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green;
                    } else if (states.contains(MaterialState.selected)) {
                      Colors.redAccent;
                    } else {
                      return Colors.orange;
                    }
                  })),
                  onPressed: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                  },
                  child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }

  bool isLoading = true;
}

class TextInputFlds extends StatelessWidget {
  TextInputFlds(
      {super.key,
      required this.hintText,
      required this.validation,
      required this.controller,
      this.keyBoardType = TextInputType.emailAddress,
      required this.focusNode,
      this.obsecure = false});
  String hintText;
  TextEditingController controller;
  String? Function(String?)? validation;
  TextInputType keyBoardType;
  bool obsecure;
  FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.password,
            color: focusNode.hasFocus ? Colors.orange : Colors.blueGrey),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.green)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
