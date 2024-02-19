import 'package:cv_maker/extenstions/string.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class Templates {
  Future<ImageProvider> assetImage(String filename) async {
    final byteData = await rootBundle.load(filename);
    return MemoryImage(byteData.buffer.asUint8List());
  }

  Future<Uint8List> makePdf() async {
    final pdf = Document();
    final phoneIcon = await assetImage('assets/icons/phone-call.png');
    final emailIcon = await assetImage('assets/icons/mail.png');
    final locationIcon = await assetImage('assets/icons/location.png');
    final poppins = await rootBundle.load('assets/font/Poppins-Regular.ttf');

    pdf.addPage(
      Page(
        margin: const EdgeInsets.all(30.0),
        build: (context) {
          return Style1(
            name: 'AZEEZ AGBOOLA ODUNAYO',
            jobTitle: 'SOFTWARE DEVELOPER',
            poppins: poppins,
            phoneIcon: phoneIcon,
            emailIcon: emailIcon,
            locationIcon: locationIcon,
          );
        },
      ),
    );
    return pdf.save();
  }
}

class Style1 extends StatelessWidget {
  Style1({
    required this.name,
    required this.jobTitle,
    required this.poppins,
    required this.phoneIcon,
    required this.emailIcon,
    required this.locationIcon,
  });

  final String name;
  final String jobTitle;
  final ByteData poppins;
  final ImageProvider phoneIcon;
  final ImageProvider emailIcon;
  final ImageProvider locationIcon;

  Future<MemoryImage> assetImage(String filename) async {
    final byteData = await rootBundle.load(filename);
    return MemoryImage(byteData.buffer.asUint8List());
  }

  TextStyle get textStyleHeader4 {
    return TextStyle(
      font: Font.ttf(poppins),
      color: PdfColors.grey.shade(.2),
      fontSize: 24,
    );
  }

  TextStyle textStyleHeader5({double shade = 1}) {
    return TextStyle(
      fontSize: 13,
      lineSpacing: 1.5,
      font: Font.ttf(poppins),
      fontWeight: FontWeight.bold,
      color: PdfColors.grey.shade(shade),
    );
  }

  TextStyle textStyleBody({double shade = 1}) {
    return TextStyle(
      fontSize: 10,
      lineSpacing: 1.5,
      wordSpacing: 1.5,
      font: Font.ttf(poppins),
      color: PdfColors.grey.shade(shade),
    );
  }

  PdfColor get primaryColor => PdfColors.grey.shade(1);
  // PdfColor get primaryColor => PdfColors.blueGrey.shade(1);

  @override
  Widget build(Context context) {
    final data = <String, List<String>>{
      'PERSONAL PROJECT': <String>[
        'Distinct Nounite Academy',
        'Music Player',
        'ChatApp',
        'Amazing Clock',
      ],
      'SKILLS': <String>[
        'Mobile app development (Flutter, Kivy)',
        'Desktop application (Flutter)',
        'Database (Firebase, SQL)',
        'API Design Knowledge',
      ],
      'PROGRAMMING LANGUAGES': <String>[
        'Python',
        'Dart',
      ],
    };
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          color: primaryColor,
          // color: const PdfColor.fromInt(0xFF454545),
          child: Column(
            children: <Widget>[
              Text(
                name,
                style: textStyleHeader4,
              ),
              SizedBox(
                width: 60,
                child: Divider(
                  height: 12.0,
                  thickness: 2,
                  color: PdfColors.grey.shade(.2),
                ),
              ),
              SizedBox(height: 4),
              Text(
                jobTitle,
                style: TextStyle(
                  font: Font.ttf(poppins),
                  color: PdfColors.grey.shade(.2),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'EXPERIENCE',
                      style: TextStyle(
                        fontSize: 13,
                        letterSpacing: 1.1,
                        font: Font.ttf(poppins),
                        fontWeight: FontWeight.bold,
                        color: PdfColors.grey.shade(1),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Software Developer',
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.grey.shade(1),
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      'March 2023 - Present | Zoliks Cleaning Service',
                      style: TextStyle(
                        fontSize: 11,
                        font: Font.ttf(poppins),
                        color: PdfColors.grey.shade(1),
                      ),
                    ),
                    SizedBox(height: 15),
                    ...[
                      'Drafted and maintained software documentation.',
                      'Designed and coded new software or modified existing software to add new features.',
                      'Integrated existing software into new or modified systems or operating environments.',
                      'Implemented software solutions to enhance operational efficiency.'
                    ].map((e) => Column(children: <Widget>[
                          Row(children: <Widget>[
                            SizedBox(width: 15),
                            Ellipse(primaryColor: primaryColor),
                            SizedBox(width: 15),
                            SizedBox(
                                width: 240,
                                child: Text(e,
                                    style: TextStyle(
                                        fontSize: 10,
                                        font: Font.ttf(poppins),
                                        color: PdfColors.grey.shade(1))))
                          ]),
                          SizedBox(height: 5.0),
                        ])),
                    SizedBox(height: 20),
                    ...data.entries.map((entry) {
                      return <Widget>[
                        Text(
                          entry.key,
                          style: textStyleHeader5(shade: 1.2),
                        ),
                        SizedBox(height: 10.0),
                        ...entry.value.map(
                          (item) {
                            return Column(children: <Widget>[
                              Row(children: <Widget>[
                                SizedBox(width: 15.0),
                                Ellipse(primaryColor: primaryColor),
                                SizedBox(width: 12.0),
                                Text(
                                  item,
                                  style: textStyleBody(shade: 1.1),
                                )
                              ]),
                              SizedBox(height: 5.0),
                            ]);
                          },
                        ),
                        SizedBox(height: 15),
                      ];
                    }).expand((list) => list),
                  ],
                ),
              ),
            ),
            Container(
              width: 230,
              height: 664,
              color: primaryColor.shade(-1.6),
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'CONTACT ME',
                    style: textStyleHeader5(),
                  ),
                  SizedBox(height: 10.0),
                  ...{
                    phoneIcon: '+234 814 3780 745',
                    emailIcon: 'agboolaodunayo2016@gmail.com',
                    locationIcon:
                        '1, Alh Yinusa Street Ilage Bariga Lagos, Nigeria',
                  }.entries.map(
                    (e) {
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(7.5),
                                decoration: BoxDecoration(
                                  // color: const PdfColor.fromInt(0xFFE3E2E2),
                                  color: primaryColor.shade(-1.4),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Image(
                                  e.key,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: UrlLink(
                                  destination: _decideDestination(e.value),
                                  child: Text(
                                    e.value,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      lineSpacing: 1.5,
                                      wordSpacing: 1.5,
                                      color: PdfColors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'CAREER OBJECTIVE',
                    style: textStyleHeader5(),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Highly motivated and detail-oriented professional with expertise in data analysis, project management, and process improvement. Adept at troubleshooting and resolving complex issues. Skilled in developing and implementing innovative strategies to reduce costs and increase efficiency.',
                    style: textStyleBody(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _decideDestination(String text) {
    if (text.isEmail) return 'mailto:$text';
    if (text.isPhoneNumber) return 'tel:$text';
    if (text.isURL) return text;
    return '';
  }
}

class Ellipse extends StatelessWidget {
  final PdfColor primaryColor;

  Ellipse({required this.primaryColor});

  @override
  Widget build(Context context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
