import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarruangController extends GetxController {
  //TODO: Implement DaftarRuangController
  late TextEditingController cNamaruangan;
  late TextEditingController cGedung;
  late TextEditingController cKapasitas;
  late TextEditingController cTglpinjam;
  late TextEditingController cTglkembali;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference daftarRuang = firestore.collection('daftarRuang');
    return daftarRuang.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference daftarRuang = firestore.collection('daftarRuang');
    return daftarRuang.snapshots();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNamaruangan = TextEditingController();
    cGedung = TextEditingController();
    cKapasitas = TextEditingController();
    cTglpinjam = TextEditingController();
    cTglkembali = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNamaruangan.dispose();
    cGedung.dispose();
    cKapasitas.dispose();
    cTglpinjam.dispose();
    cTglkembali.dispose();
    super.onClose();
  }
}
