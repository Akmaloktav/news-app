class NewsException implements Exception {
  String code;
  String message;

  NewsException(this.code, this.message);

  String get userMessage {
    switch (code) {
      case 'parameterInvalid':
        return 'Ada pengaturan yang tidak didukung dalam permintaan Anda.';
      case 'parametersMissing':
        return 'Informasi yang Anda masukkan belum lengkap.';
      case 'rateLimited':
        return 'Terlalu banyak permintaan dalam waktu singkat.';
      case 'sourcesTooMany':
        return 'Sumber yang diminta terlalu banyak sekaligus.';
      case 'sourceDoesNotExist':
        return 'Sumber yang Anda cari tidak dapat ditemukan.';
      case 'unexpectedError':
      default:
        return 'Terjadi gangguan pada sistem kami. Mohon coba kembali beberapa saat lagi.';
    }
  }
}
