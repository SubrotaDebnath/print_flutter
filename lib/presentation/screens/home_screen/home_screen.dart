import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ByteData pdf;

  @override
  void initState() {
    getPdf();
    super.initState();
  }

  getPdf() async {
    pdf = await rootBundle.load('assets/actix.pdf');
    await Printing.layoutPdf(
      usePrinterSettings: true,
      onLayout: (_) => pdf.buffer.asUint8List(),
    );
    //

    PdfDocument pdfDocument = PdfDocument(pageMode: PdfPageMode.fullscreen);

    final p = PdfInfo(
      pdfDocument,
    );

    print('Pdf info: ${p.pdfDocument}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
