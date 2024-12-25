import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfPath;

  const PdfViewerPage({Key? key, required this.pdfPath}) : super(key: key);

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? localPath;
  int lastPage = 0; // Default to page 0

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  // Load the PDF file
  Future<void> loadPdf() async {
    try {
      if (widget.pdfPath.startsWith('assets/')) {
        final ByteData data = await rootBundle.load(widget.pdfPath);
        final dir = await getTemporaryDirectory();
        final file = File("${dir.path}/temp.pdf");
        await file.writeAsBytes(data.buffer.asUint8List());
        setState(() {
          localPath = file.path;
        });
      } else {
        setState(() {
          localPath = widget.pdfPath;
        });
      }
    } catch (e) {
      debugPrint("Error loading PDF: $e");
      setState(() {
        localPath = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: localPath == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: PDFView(
          filePath: localPath!,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: false,
          onRender: (pages) {
            debugPrint("PDF loaded with $pages pages.");
          },
          onError: (error) {
            debugPrint("Error loading PDF: $error");
          },
          onPageChanged: (currentPage, totalPages) {
            debugPrint("Current page: $currentPage, Total pages: $totalPages");
          },
        ),
      ),
    );
  }
}
