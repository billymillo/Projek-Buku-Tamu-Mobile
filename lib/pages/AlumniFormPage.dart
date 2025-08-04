import 'package:flutter/material.dart';

class AlumniFormPage extends StatefulWidget {
  const AlumniFormPage({super.key});

  @override
  State<AlumniFormPage> createState() => _AlumniFormPageState();
}

class _AlumniFormPageState extends State<AlumniFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedPurpose;
  final purposes = ['Menjemput', 'Mengantar Barang', 'Lainnya'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF112D4E),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              ),
              alignment: Alignment.bottomLeft,
              child: const Text('Alumni', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _inputField('Nama'),
                      _inputField('Lulusan Tahun'),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: DropdownButtonFormField<String>(
                          value: selectedPurpose,
                          hint: const Text('Masukkan Keperluan'),
                          items: purposes.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          onChanged: (val) => setState(() => selectedPurpose = val),
                          decoration: _inputDecoration(),
                        ),
                      ),
                      _inputField('Jurusan'),
                      _inputField('No. Telp', type: TextInputType.phone),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _iconButton(Icons.camera_alt),
                          const SizedBox(width: 10),
                          _iconButton(Icons.edit),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          _actionButton('Kembali', Colors.grey[300]!, Colors.black),
                          const SizedBox(width: 10),
                          _actionButton('Simpan', const Color(0xFF112D4E), Colors.white),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() => InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      );

  Widget _inputField(String label, {TextInputType? type}) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: TextFormField(
          keyboardType: type,
          decoration: _inputDecoration().copyWith(labelText: label, hintText: 'Masukkan $label'),
        ),
      );

  Widget _iconButton(IconData icon) => Expanded(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Icon(icon, size: 36, color: Colors.blueGrey)),
        ),
      );

  Widget _actionButton(String text, Color bg, Color fg) => Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: fg,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: Text(text),
        ),
      );
}
