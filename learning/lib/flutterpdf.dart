import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfData extends StatefulWidget {
  const PdfData({super.key});

  @override
  State<PdfData> createState() => _PdfDataState();
}

class _PdfDataState extends State<PdfData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPdfFromApi();
  }

  Uint8List? pdfBytes;
  Future fetchPdfFromApi() async {
    try {
      final url =
          'http://webdev.aeonx.digital/expensereport/report-pdf?repcode=179';
      var response = await get(Uri.parse(url), headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImp0aSI6IjRmMWcyM2ExMmFhIn0.eyJpc3MiOiJodHRwOlwvXC93ZWJkZXYuYWVvbnguZGlnaXRhbFwvIiwiYXVkIjoiaHR0cDpcL1wvd2ViZGV2LmFlb254LmRpZ2l0YWxcLyIsImp0aSI6IjRmMWcyM2ExMmFhIiwiaWF0IjoxNjkwODc0MDA5LCJleHAiOjE2OTA4Nzc2MDksInVpZCI6MTAwfQ.RFxfiAM6OC18enmpkDJOJPmcub-9ELyB2QoH3K74o7VvlcNMGpMAscCSyJQ8BYdBumAJfBe2zQ07fY-c6sbD8A',
      });
      var data = response.body.toString();

      print('data ${data}');

      if (response.statusCode == 200) {
        print('if ${data}');
        pdfBytes = response.bodyBytes;
        print('pdfBytes  ${pdfBytes}');
      } else {
        print('else ${data}');
        // Handle error if needed
      }
    } catch (e) {
      print('e ${e.toString()}');
    }
  }

  Future<void> _downloadPDF() async {
    try {
      print('try executed');
      final path = (await getExternalStorageDirectory())?.path;
      final file = File('${path}/downloaded_file.pdf');
      await file.writeAsBytes(pdfBytes!);
      print('file ${file}');
      OpenFile.open(file.path);
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: _downloadPDF,
          ),
        ],
      ),
      body: Center(
        child: pdfBytes != null
            ? PDFView(
                pdfData: pdfBytes,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final Uint8List pdfData;

  PDFScreen({required this.pdfData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PDFView(
          pdfData: pdfData,
        ),
      ),
    );
  }
}
