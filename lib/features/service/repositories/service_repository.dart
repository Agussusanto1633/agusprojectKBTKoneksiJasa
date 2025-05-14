import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/service_model.dart';

class ServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceModel>> getServices() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('services').get();

      return snapshot.docs.map((doc) {
        return ServiceModel.fromJson(
            doc.data() as Map<String, dynamic>,
            doc.id
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch services: $e');
    }
  }

  Future<ServiceModel?> getServiceById(String serviceId) async {
    try {
      final DocumentSnapshot doc = await _firestore
          .collection('services')
          .doc(serviceId)
          .get();

      if (doc.exists) {
        return ServiceModel.fromJson(
            doc.data() as Map<String, dynamic>,
            doc.id
        );
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch service: $e');
    }
  }
}