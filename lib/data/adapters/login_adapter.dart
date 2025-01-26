import 'dart:convert';

import 'package:agile_crafts/data/models/login_response.dart';
import 'package:flutter_data/flutter_data.dart';

import '../../core/config/api_endpoints.dart';
import '../../core/config/environment.dart';
import '../models/login_request.dart';

mixin LoginAdapter on RemoteAdapter<LoginResponse> {
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    final headers = {
      'Content-Type': 'application/json', // Added Content-Type header
      'Abp.TenantId': '10',
    };

    // Prepare the request body
    final body = jsonEncode({
      'userNameOrEmailAddress': loginRequest.userNameOrEmailAddress,
      'password': loginRequest.password,
    });

    try {
      // Send the request
      final response = await sendRequest(
        Uri.parse(Environment.apiUrl + ApiEndpoints.loginUrl),
        method: DataRequestMethod.POST,
        headers: headers,
        body: body,
      );

      // Parse the response to a Map
      final jsonResponse = jsonDecode(response.body);

      // Check if `result` key exists
      if (jsonResponse['result'] != null) {
        // Deserialize into LoginResponse
        return LoginResponse.fromJson(jsonResponse['result']);
      } else {
        throw Exception('Invalid response: "result" field missing');
      }
    } catch (e) {
      // Handle errors (e.g., log the error, rethrow, or return a default response)
      throw Exception('Login failed: $e');
    }
  }
}
