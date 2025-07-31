import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/dashboard/data/models/dashboard_model.dart';
import 'package:mchat/features/dashboard/data/services/dasboard_service.dart';

final dashboardProvider = FutureProvider<DashboardModel>((ref) async {
  final result = await ref.read(dashboardServiceProvider).dashboard();
  return DashboardModel.fromJson(result);
});
