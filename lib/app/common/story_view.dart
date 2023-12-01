import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  final controller = StoryController();
  late List<StoryItem> storyItems = [
    StoryItem.text(
        key: Key("11"),
        title: "First Story",
        backgroundColor: Colors.yellow.withOpacity(.6)),
    StoryItem.pageImage(
        key: Key("12"),
        caption: "Image Caption",
        url:
            "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGxhY2V8ZW58MHx8MHx8fDA%3D",
        controller: controller),
    StoryItem.text(
        key: Key("13"),
        title: "Third Story",
        backgroundColor: Colors.green.withOpacity(.6)),
    StoryItem.pageImage(
        key: Key("14"),
        url:
            "https://plus.unsplash.com/premium_photo-1672252617591-cfef963eeefa?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        controller: controller),
    StoryItem.inlineImage(
        key: Key("14"),
        roundedBottom: true,
        imageFit: BoxFit.cover,
        roundedTop: true,
        url:
            "https://plus.unsplash.com/premium_photo-1672252617591-cfef963eeefa?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        controller: controller),
  ];
  @override
  Widget build(BuildContext context) {
    return StoryView(
        storyItems: storyItems,
        controller: controller,
        repeat: true, // should the stories be slid forever
        onStoryShow: (s) {
          print("shoe===${s.view.key}");
        },
        onComplete: () {},
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        });
  }
}
