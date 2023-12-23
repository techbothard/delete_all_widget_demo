import 'dart:developer';

import 'package:delete_all_widget_demo/app/common/cv_maker/as.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:delete_all_widget_demo/app/common/cv_maker/model.dart';
import 'package:flutter/material.dart';

import 'final_view.dart';

class CVPdfScreen extends StatefulWidget {
  const CVPdfScreen({super.key});

  @override
  State<CVPdfScreen> createState() => _CVPdfScreenState();
}

class _CVPdfScreenState extends State<CVPdfScreen> {
  Resume resume = Resume(
      profile: DataConstance().profile,
      contact: DataConstance().contact,
      experiences: DataConstance().experiences,
      projects: DataConstance().projects,
      educations: DataConstance().educations,
      skills: DataConstance().skills,
      languages: DataConstance().languages,
      references: DataConstance().refrences,
      profileSummary: DataConstance().profileSummary);
  XFile? as;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CV Maker"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                final img =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (img != null) {
                  as = img;
                  setState(() {});
                }
              },
              child: Text("tap")),
          ElevatedButton(
              onPressed: () {
                _createFile(context);
              },
              child: Text("View CV"))
        ],
      ),
    );
  }

  _createFile(context) async {
    await pdfmaker(resume);
    _previewPdfFile(context, DataConstance().profile.name);
  }

  pdfmaker(Resume resume) async {
    final pdf = pw.Document();
    pw.Image image1 = pw.Image(pw.MemoryImage(resume.profile.imagePath));

    final pageWidth = 21.0 * PdfPageFormat.cm;
    final pageHeight = 29.7 * PdfPageFormat.cm;
    pw.Widget getDivider() => pw.Container(
        color: PdfColors.black,
        margin: pw.EdgeInsets.all(8),
        height: 1,
        width: pageWidth);

    pw.Widget getExperienceItem(context, Experience experience) => pw.Padding(
          padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: pw.Column(
            children: [
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(
                  '${experience.companyName}',
                  style: pw.TextStyle(color: PdfColors.blue),
                ),
              ),
              pw.SizedBox(height: 1),
              pw.Row(
                children: [
                  pw.Container(
                    alignment: pw.Alignment.centerLeft,
                    child: pw.Text(
                      experience.designation,
                    ),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.centerLeft,
                    child: pw.Text(
                      '${DateFormat.yMMM().format(experience.startDate)} - ${experience.endDate.difference(DateTime.now()).inDays == 0 ? 'Present' : DateFormat.yMMM().format(experience.endDate)}',
                    ),
                  )
                ],
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              ),
              pw.SizedBox(height: 1),
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(
                  '${experience.summary}',
                  textAlign: pw.TextAlign.justify,
                ),
              ),
            ],
          ),
        );

    List<pw.Widget> _buildExperienceList(context) {
      List<pw.Widget> experienceWidgetList = [];
      resume.experiences.forEach((item) {
        experienceWidgetList.add(getExperienceItem(context, item));
      });

      experienceWidgetList.insert(
        0,
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          child: pw.Text(
            'Experience',
          ),
        ),
      );

      experienceWidgetList.insert(
        1,
        getDivider(),
      );

      return experienceWidgetList;
    }

    pw.Widget getExperience(context) => pw.Column(
        mainAxisSize: pw.MainAxisSize.min,
        children: _buildExperienceList(context));

    pw.Widget getEducationItem(context, Education education) => pw.Padding(
        padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: pw.Column(children: <pw.Widget>[
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              '${education.courseTaken}',
            ),
          ),
          pw.SizedBox(height: 1),
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text('${education.universityName}',
                style: pw.TextStyle(color: PdfColors.blue)),
          ),
          pw.SizedBox(height: 1),
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              '${DateFormat.yMMM().format(education.startDate)} - ${education.endDate.difference(DateTime.now()).inDays == 0 ? 'Present' : DateFormat.yMMM().format(education.endDate)}',
            ),
          ),
        ]));

    List<pw.Widget> _buildEducationList(context) {
      List<pw.Widget> widgetList = [];
      resume.educations.forEach((item) {
        widgetList.add(getEducationItem(context, item));
      });

      widgetList.insert(
        0,
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          child: pw.Text(
            'Education',
          ),
        ),
      );

      widgetList.insert(
        1,
        getDivider(),
      );

      return widgetList;
    }

    pw.Widget getEducation(context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: _buildEducationList(context));

    pw.Widget getProjectItem(context, Project project) => pw.Padding(
        padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: pw.Column(children: <pw.Widget>[
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              project.projectName,
              style: pw.TextStyle(color: PdfColors.blue),
            ),
          ),
          pw.SizedBox(height: 1),
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              '${DateFormat.yMMM().format(project.startDate)} - ${project.endDate.difference(DateTime.now()).inDays == 0 ? 'Present' : DateFormat.yMMM().format(project.endDate)}',
            ),
          ),
          pw.SizedBox(height: 1),
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              project.projectSummary,
              textAlign: pw.TextAlign.justify,
            ),
          ),
        ]));

    List<pw.Widget> _buildProjectList(context) {
      List<pw.Widget> widgetList = [];
      resume.projects.forEach((item) {
        widgetList.add(getProjectItem(context, item));
      });

      widgetList.insert(
        0,
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          child: pw.Text(
            'Project',
          ),
        ),
      );

      widgetList.insert(
        1,
        getDivider(),
      );

      return widgetList;
    }

    pw.Widget getProjects(context) =>
        pw.Column(children: _buildProjectList(context));

    pw.Widget getReferenceItem(context, Reference reference) => pw.Padding(
        padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: pw.Column(children: <pw.Widget>[
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              reference.name,
              // style: Theme.of(context).header5,
            ),
          ),
          pw.SizedBox(height: 1),
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              '${reference.company}',
              // style: Theme.of(context).bulletStyle,
            ),
          ),
          pw.SizedBox(height: 1),
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              'Email: ${reference.email}',
              // style: Theme.of(context).paragraphStyle,
            ),
          ),
        ]));

    List<pw.Widget> _buildReferenceList(context) {
      List<pw.Widget> widgetList = [];
      resume.references.forEach((item) {
        widgetList.add(getReferenceItem(context, item));
      });

      widgetList.insert(
        0,
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          child: pw.Text(
            'Reference',
          ),
        ),
      );

      widgetList.insert(
        1,
        getDivider(),
      );

      return widgetList;
    }

    pw.Widget getReference(context) => pw.Column(
          children: _buildReferenceList(context),
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
        );

    pw.Widget getSkillsItem(context, String skill) => pw.Padding(
        padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 4),
        child: pw.Text(
          skill,
          textAlign: pw.TextAlign.left,
        ));

    List<pw.Widget> _buildSkillList(context) {
      List<pw.Widget> widgetList = [];
      resume.skills.forEach((item) {
        widgetList.add(getSkillsItem(context, item));
      });

      widgetList.insert(
        0,
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          child: pw.Text('Skill'),
        ),
      );

      widgetList.insert(
        1,
        getDivider(),
      );

      return widgetList;
    }

    pw.Widget getSkills(context) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: _buildSkillList(context),
        );

    pw.Widget getLanguageItem(context, Language language) => pw.Padding(
        padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 4),
        child: pw.Column(
          children: <pw.Widget>[
            pw.Text(
              '${language.name}',
              // style: Theme.of(context).paragraphStyle,
              textAlign: pw.TextAlign.left,
            ),
            pw.SizedBox(height: 1),
            pw.Text(
              '${language.level}',
              // style: Theme.of(context).bulletStyle,
              textAlign: pw.TextAlign.left,
            )
          ],
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
        ));

    List<pw.Widget> _buildLanguageList(context) {
      List<pw.Widget> widgetList = [];
      resume.languages.forEach((item) {
        widgetList.add(getLanguageItem(context, item));
      });

      widgetList.insert(
        0,
        pw.Container(
          alignment: pw.Alignment.centerLeft,
          child: pw.Text(
            'Language',
          ),
        ),
      );

      widgetList.insert(
        1,
        getDivider(),
      );

      return widgetList;
    }

    pw.Widget getLanguage(context) => pw.Column(
          children: _buildLanguageList(context),
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
        );

    pw.Widget getContact(context) => pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(
                  'Contact',
                ),
              ),
              getDivider(),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 4),
                child: pw.Text(
                  '${resume.profile.currentCityAndCountry}',
                  // style: Theme.of(context).bulletStyle,
                ),
              ),
              pw.SizedBox(height: 1),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 4),
                child: pw.Text(
                  '${resume.contact.countryCode} ${resume.contact.phone}',
                  // style: Theme.of(context).bulletStyle,
                ),
              ),
              pw.SizedBox(height: 1),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 4),
                child: pw.Text(
                  '${resume.contact.email}',
                  // style: Theme.of(context).bulletStyle,
                ),
              ),
              pw.SizedBox(height: 1),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 4),
                child: pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    'LinkedIn',
                    // style: Theme.of(context)
                    //     .bulletStyle
                    //     .copyWith(color: PdfColors.blue),
                  ),
                ),
              ),
            ]);

    pw.Widget getMainRowItem(context) => pw.Row(
          children: [
            pw.Container(
              padding: pw.EdgeInsets.only(left: 16, right: 16),
              width: pageWidth * 0.6,
              child: pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  getExperience(context),
                  pw.SizedBox(height: 12),
                  getProjects(context),
                ],
              ),
            ),
            pw.SizedBox(width: 20),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                getContact(context),
                pw.SizedBox(height: 12),
                getEducation(context),
                pw.SizedBox(height: 12),
                getSkills(context),
                pw.SizedBox(height: 12),
                getLanguage(context),
                pw.SizedBox(height: 12),
                getReference(context),
                pw.SizedBox(height: 12),
              ],
            )
          ],
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
        );

    pw.Widget _getProfileImage(context) {
      return pw.Positioned(
        top: 16,
        left: 16,
        child: pw.Container(
          width: pageHeight * 0.125,
          height: pageHeight * 0.125,
          child: image1,
        ),
      );
    }

    pw.Widget _getSummary(context) {
      return pw.Positioned(
        top: 16,
        left: pageHeight * 0.15 + 16,
        right: 16,
        bottom: pageHeight * 0.075,
        child: pw.Container(
            child: pw.Column(children: [
          pw.Container(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              'Summary',
              // style: Theme.of(context).header3,
              textAlign: pw.TextAlign.justify,
            ),
          ),
          // getDivider(),
          pw.Padding(
            padding: pw.EdgeInsets.only(left: 8, right: 8, bottom: 4),
            child: pw.Text(
              resume.profileSummary,
              // style: Theme.of(context).tableCell,
              softWrap: true,
            ),
          ),
        ])),
      );
    }

    pw.Widget _getName(context) {
      return pw.Positioned(
        top: pageHeight * 0.15,
        left: 0,
        child: pw.Container(
          padding: pw.EdgeInsets.only(left: 16),
          alignment: pw.Alignment.bottomLeft,
          height: pageHeight * 0.05,
          child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    resume.profile.name,
                  ),
                ),
                pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    resume.profile.designation,
                  ),
                ),
              ]),
        ),
      );
    }

    pw.Widget getProfileRow(context) => pw.Container(
          height: pageHeight * 0.2,
          child: pw.Stack(children: [
            _getProfileImage(context),
            _getSummary(context),
            _getName(context),
          ]),
        );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a3,
        build: (context) {
          return pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
            getProfileRow(context),
            pw.SizedBox(height: 10),
            getMainRowItem(context),
          ]);
        },
      ),
    );

    final path = await getApplicationDocumentsDirectory();
    time = DateTime.now();
    final file = File(
        "${path.path}/${time}${resume.profile.name.replaceAll(' ', '_')}.pdf");
    file.writeAsBytesSync(await pdf.save());
  }
}

DateTime? time;
_previewPdfFile(context, String name) {
  getApplicationDocumentsDirectory().then((value) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FinalViewScreen(
              pathPDF:
                  '${value.path}/${time}${name.replaceAll(' ', '_')}.pdf')),
    );
  });
}

pdfViewers() {
  // final Document pdf = Document();
  // final img = ImageLibrary.decodeImage(
  //     File("${resume.profile.imagePath}").readAsBytesSync());
  // final image = PdfImage(
  //   pdf.document,
  //   image: img.data.buffer.asUint8List(),
  //   width: img.width,
  //   height: img.height,
  // );
  // final pageWidth = 21.0 * PdfPageFormat.cm;
  // final pageHeight = 29.7 * PdfPageFormat.cm;

  ///`````///

  // pdf.addPage(
  //   MultiPage(
  //       pageFormat: PdfPageFormat(pageWidth, pageHeight, marginAll: 0),
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       build: (Context context) => <Widget>[
  //         getProfileRow(context),
  //         SizedBox(height: 8),
  //         getMainRowItem(context),
  //       ]),
  // );
  // final path = await getApplicationDocumentsDirectory();
  // final file =
  // File("${path.path}/${resume.profile.name.replaceAll(' ', '_')}.pdf");
  // file.writeAsBytesSync(pdf.save());
}
