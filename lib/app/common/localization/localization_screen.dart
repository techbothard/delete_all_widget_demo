import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'localizations.dart';

class LocalizationScreen extends StatefulWidget {
  const LocalizationScreen({super.key});

  @override
  State<LocalizationScreen> createState() => _LocalizationScreenState();
}

class _LocalizationScreenState extends State<LocalizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            DropdownButton<LanguageModel>(
              underline: const SizedBox(),
              // padding: EdgeInsets.zero,
              icon: Image.asset(
                "assets/images/language.png",
                height: 30,
                color: Colors.white,
              ),
              onChanged: (LanguageModel? newValue) {
                context
                    .read<HomeLocalController>()
                    .updateLocale(_changeLanguage(newValue!, context));
              },
              items: LanguageModel.languageList()
                  .map<DropdownMenuItem<LanguageModel>>((LanguageModel value) {
                return DropdownMenuItem<LanguageModel>(
                  value: value,
                  child: Text(value.name.toString()),
                );
              }).toList(),
            ),
            SizedBox(
              height: 30,
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: titleList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Text(AppLocalization.of(context)
                    .getTranslatedValue(titleList[index])
                    .toString());
              },
            )
          ],
        ),
      ),
    );
  }
}

List<String> titleList = [
  "first",
  "second",
  "third",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten"
];

class LanguageModel {
  final String name;
  final String flag;
  final String languageCode;

  LanguageModel(this.name, this.flag, this.languageCode);

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel("English", "US", "en"),
      LanguageModel("हिंदी", "IN", "hi"),
    ];
  }
}

Locale _changeLanguage(LanguageModel language, context) {
  // Use a map to lookup the locale for the given language code.
  final locales = {
    "hi": const Locale("hi", "IN"),
    "en": const Locale("en", "US"),
  };

  // Return the locale for the given language code, or the default locale if the language code is not found.
  return locales[language.languageCode] ?? Locale(language.languageCode, "US");
}

class HomeLocalController extends ChangeNotifier {
  Locale locale = const Locale('en', "US");
  updateLocale(Locale a) {
    locale = a;
    notifyListeners();
  }
}
