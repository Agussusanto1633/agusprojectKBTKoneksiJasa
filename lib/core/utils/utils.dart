class Utils {
  static String formatRupiah(int? number) {
    if (number == null) return 'Rp. 0';
    final formatted = number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
    );
    return 'Rp. $formatted';
  }
}
