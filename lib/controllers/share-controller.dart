import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/invoice.dart';



buildInvoicePdfContent(Invoice invoice) {
  String referenceNo = invoice.referenceNumber;
  String appointmentDate = invoice.appointmentDate;
  String appointmentNumber = invoice.appointmentNumber;
  String petId = invoice.petId;
  String petName = invoice.petName;
  String time = invoice.time;
  String totalFee = invoice.totalFee;
  return pw.Padding(
      padding: const pw.EdgeInsets.all(25.0),
      child:
      pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
        pw.Text('Ref. no: $referenceNo'), pw.SizedBox(height: 10.0),
        pw.Text("Time: $time"), pw.SizedBox(height: 10.0),
        pw.Text("Appointment Date: $appointmentDate"), pw.SizedBox(height: 10.0),
        pw.Text("Appointment No: $appointmentNumber"),
        pw.SizedBox(height: 10.0), pw.Text("Patient Details"),
        pw.SizedBox(height: 10.0), pw.Text("Pet Name: $petName"),
        pw.SizedBox(height: 10.0), pw.Text("Pet ID: $petId"),
        pw.SizedBox(height: 30.0), pw.Text("Total Fee(LKR): $totalFee")
      ]));
}

Future<void> printDoc(String action, Invoice invoice) async {
  final doc = pw.Document();
  doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a5,
      build: (pw.Context context) {
          return buildInvoicePdfContent(invoice);

      }));
  if(action == 'share'){
    await Printing.sharePdf(bytes: await doc.save(), filename: 'invoice.pdf');
  }else{
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

}
