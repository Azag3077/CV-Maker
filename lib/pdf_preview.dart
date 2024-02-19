import 'package:cv_maker/style1.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({
    Key? key,
  }) : super(key: key);

  Future<bool> onBackButtonPressed() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackButtonPressed,
      child: Scaffold(
        body: PdfPreview(
          canDebug: false,
          maxPageWidth: 800,
          // pdfFileName: 'Zoliks Cleaning estimate $firstName $lastName.pdf',
          padding: const EdgeInsets.all(20),
          // actions: [
          //   IconButton(
          //       onPressed: () async {
          //         Directory docDir = await getApplicationDocumentsDirectory();
          //         String filename =
          //             '${docDir.path}/Zoliks Cleaning estimate $firstName $lastName.pdf';
          //         await File(filename).writeAsBytes(await makePdf());
          //
          //         // const snackBar = SnackBar(
          //         //   content: Row(
          //         //     children: <Widget>[
          //         //       Icon(Icons.check_circle_outline_rounded,
          //         //           color: Colors.grey),
          //         //       SizedBox(width: 8.0),
          //         //       Expanded(
          //         //           child: Text(
          //         //               'File has been saved to the document folder successfully'))
          //         //     ],
          //         //   ),
          //         //   padding: EdgeInsets.symmetric(
          //         //       horizontal: 16.0, vertical: 10.0),
          //         //   duration: Duration(seconds: 3),
          //         //   behavior: SnackBarBehavior.floating,
          //         // );
          //         // ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
          //         // Get.snackbar('Success', 'File has been saved to the document folder successfully');
          //       },
          //       icon: const Icon(Icons.download)
          //       // onPressed: () => sendEmailWithAttachment(),
          //       // icon: const Icon(Icons.attach_email_rounded)
          //       )
          // ],
          build: (context) => Templates().makePdf(),
          // build: (context) => generatePDF(),
        ),
      ),
    );
  }
}
