import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/theme/color_value.dart';

Future<DateTime?> showCalendarBottomSheet(BuildContext context) {
  return showModalBottomSheet<DateTime>(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      DateTime selectedDate = DateTime.now();
      DateTime focusedDate = DateTime.now();

      return StatefulBuilder(
        builder: (context, setState) {
          final dateFormatted = DateFormat(
            "EEEE, d MMMM yyyy",
            'id_ID',
          ).format(selectedDate);

          return Padding(
            padding: MediaQuery.of(context).viewInsets + EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        toBeginningOfSentenceCase(
                              DateFormat(
                                "EEEE, d MMMM yyyy",
                                'id_ID',
                              ).format(selectedDate),
                            ) ??
                            '',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.chevron_left),
                          onPressed:
                              focusedDate.isAfter(DateTime.now())
                                  ? () {
                                    setState(() {
                                      focusedDate = DateTime(
                                        focusedDate.year,
                                        focusedDate.month - 1,
                                      );
                                    });
                                  }
                                  : null,
                        ),
                        IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () {
                            setState(() {
                              focusedDate = DateTime(
                                focusedDate.year,
                                focusedDate.month + 1,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "Pilih tanggal layanan",
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    height: 2,
                  ),
                ),
                SizedBox(height: 16.w),

                // Kalender
                SizedBox(
                  // height: 300.w,
                  child: TableCalendar(
                    locale: 'id_ID',
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    focusedDay: focusedDate,
                    selectedDayPredicate: (day) => isSameDay(selectedDate, day),

                    enabledDayPredicate: (day) {
                      final now = DateTime.now();
                      final today = DateTime(now.year, now.month, now.day);
                      final checkDay = DateTime(day.year, day.month, day.day);
                      return !checkDay.isBefore(today);
                    },

                    onDaySelected: (selectedDay, focusDay) {
                      final now = DateTime.now();
                      final today = DateTime(now.year, now.month, now.day);
                      final checkSelected = DateTime(
                        selectedDay.year,
                        selectedDay.month,
                        selectedDay.day,
                      );

                      if (checkSelected.isBefore(today)) {
                        return;
                      }

                      setState(() {
                        selectedDate = selectedDay;
                        focusedDate = focusDay;
                      });
                    },

                    headerVisible: false,
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.inter(
                        color: ColorValue.darkColor.withOpacity(0.5),
                      ),
                      weekendTextStyle: GoogleFonts.inter(
                        color: const Color(0xFFF36A6A),
                      ),
                      selectedDecoration:
                          const BoxDecoration(), // kosongkan supaya tidak bentrok
                      todayDecoration: const BoxDecoration(),
                      disabledTextStyle: GoogleFonts.inter(
                        color: ColorValue.darkColor.withOpacity(0.2),
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: ColorValue.darkColor.withOpacity(0.5),
                        fontSize: 12.sp,
                      ),
                      weekendStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFF36A6A),
                        fontSize: 12.sp,
                      ),
                    ),

                    // Override tampilan tanggal terpilih & hari ini
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, date, _) {
                        return Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: ColorValue.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${date.day}',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                      todayBuilder: (context, date, _) {
                        return Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${date.day}',
                            style: GoogleFonts.inter(
                              color: ColorValue.darkColor.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20.w),

                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 120.w,
                    height: 34.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorValue.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context, selectedDate),
                      child: Text(
                        "Pilih Tanggal",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: ColorValue.darkColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.w),
              ],
            ),
          );
        },
      );
    },
  );
}
