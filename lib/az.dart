import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generatePDF() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (context) {
        // return pw.UrlLink(destination: imageUrl, child: pw.Text('LINK', style: pw.TextStyle(fontSize: size)));
        return pw.Center(
          child: pw.UrlLink(
            destination: 'www.google.com',
            // destination: 'mailto:your@email.com',
            child: pw.Text(
              'Click to open AZAG',
              style: const pw.TextStyle(
                color: PdfColors.blue,
                decoration: pw.TextDecoration.underline,
              ),
            ),
          ),
        );
      },
    ),
  );

  return pdf.save();
}

void main() async {
  final Uint8List pdfBytes = await generatePDF();
  // Save or display the PDF as needed
}
