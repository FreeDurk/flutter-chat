import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/network/api_client.dart';
import 'package:mchat/core/providers/token_notifier.dart';

final dioProvider = Provider<Dio>((ref) {
  final token =  ref.watch(tokenNotifierProvider).value;
  return ApiClient(token ?? '').client;
});