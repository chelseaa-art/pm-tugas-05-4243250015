import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:umkm_kuliner_medan/main.dart';

void main() {
  // ==========================================
  // PENGUJIAN 1: HALAMAN UTAMA
  // ==========================================

  testWidgets('Aplikasi Dapur Medan berhasil ditampilkan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const UmkmKulinerApp());

    expect(find.text('Dapur Medan'), findsWidgets);
    expect(find.text('Informasi Usaha'), findsOneWidget);
    expect(find.text('Daftar Menu Makanan'), findsOneWidget);
    expect(find.text('Daftar Menu Minuman'), findsOneWidget);
  });

  // ==========================================
  // PENGUJIAN 2: SELURUH DAFTAR MENU
  // ==========================================

  testWidgets('Semua 13 menu berhasil ditampilkan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const UmkmKulinerApp());

    // Menu makanan
    expect(find.text('Nasi Goreng Medan'), findsOneWidget);
    expect(find.text('Mie Gomak'), findsOneWidget);
    expect(find.text('Soto Medan'), findsOneWidget);
    expect(find.text('Bika Ambon'), findsOneWidget);
    expect(find.text('Lontong Medan'), findsOneWidget);
    expect(find.text('Mie Sop'), findsOneWidget);
    expect(find.text('Mie Balap'), findsOneWidget);
    expect(find.text('Nasi Campur Medan'), findsOneWidget);

    // Menu minuman
    expect(find.text('Teh Manis Dingin'), findsOneWidget);
    expect(find.text('Kopi Sidikalang'), findsOneWidget);
    expect(find.text('Es Campur'), findsOneWidget);
    expect(find.text('Es Teler'), findsOneWidget);
    expect(find.text('Bandrek'), findsOneWidget);
  });

  // ==========================================
  // PENGUJIAN 3: TOMBOL FAVORIT
  // ==========================================

  testWidgets('Tombol favorit dapat mengubah ikon hati', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const UmkmKulinerApp());

    // Cari tombol favorit pertama
    final tombolFavorit = find.byTooltip('Tambah favorit').first;

    // Pastikan tombol terlihat
    await tester.ensureVisible(tombolFavorit);
    await tester.pumpAndSettle();

    // Pastikan ikon awal adalah hati kosong
    expect(find.byIcon(Icons.favorite_border), findsWidgets);

    // Tekan tombol favorit
    await tester.tap(tombolFavorit);
    await tester.pump();

    // Pastikan ikon berubah menjadi hati terisi
    expect(find.byTooltip('Hapus favorit'), findsWidgets);

    expect(find.byIcon(Icons.favorite), findsWidgets);

    // Pastikan SnackBar muncul
    expect(
      find.text('Nasi Goreng Medan ditambahkan ke favorit'),
      findsOneWidget,
    );
  });

  // ==========================================
  // PENGUJIAN 4: MODE TERANG DAN GELAP
  // ==========================================

  testWidgets('Mode terang dan gelap dapat diubah', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const UmkmKulinerApp());

    // Pastikan tombol untuk mengaktifkan mode gelap tersedia
    expect(find.byTooltip('Aktifkan mode gelap'), findsOneWidget);

    // Tekan tombol mode gelap
    await tester.tap(find.byTooltip('Aktifkan mode gelap'));
    await tester.pumpAndSettle();

    // Pastikan tombol berubah menjadi mode terang
    expect(find.byTooltip('Aktifkan mode terang'), findsOneWidget);

    // Tekan kembali untuk mengaktifkan mode terang
    await tester.tap(find.byTooltip('Aktifkan mode terang'));
    await tester.pumpAndSettle();

    // Pastikan kembali ke mode gelap
    expect(find.byTooltip('Aktifkan mode gelap'), findsOneWidget);
  });
}
