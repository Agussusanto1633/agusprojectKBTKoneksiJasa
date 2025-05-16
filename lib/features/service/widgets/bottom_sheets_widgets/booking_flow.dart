import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'bottom_sheets/calendar_bottom_sheet.dart';
import 'bottom_sheets/time_bottom_sheet.dart';
import 'bottom_sheets/worker_bottom_sheet.dart';

Future<void> startBookingFlow(BuildContext context) async {
  final selectedDate = await showCalendarBottomSheet(context);
  if (selectedDate == null) return;

  final selectedTime = await showTimeBottomSheet(context, selectedDate);
  if (selectedTime == null) return;

  final selectedWorker = await showWorkerBottomSheet(
    context,
    selectedDate,
    selectedTime,
  );
  if (selectedWorker == null) return;

  // Format tanggal ke: 13 April 2025
  final formattedDate = DateFormat("d MMMM yyyy", "id_ID").format(selectedDate);

  final resultMessage = "$formattedDate, $selectedTime, $selectedWorker";

  // Tampilkan snackbar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(resultMessage),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 4),
    ),
  );
}
