import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/dio_provider.dart';

class DasboardService {
  final Dio dio;

  DasboardService(this.dio);

  Future dashboard() async {
    try {
      final response = await dio.get('/user/dashboard');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

final dashboardServiceProvider = Provider(
  (ref) => DasboardService(ref.read(dioProvider)),
);
