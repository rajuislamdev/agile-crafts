import 'dart:async';

import 'package:agile_crafts/core/config/api_endpoints.dart';
import 'package:agile_crafts/core/config/environment.dart';
import 'package:flutter_data/flutter_data.dart';

mixin JSONPlaceholderAdapter<T extends DataModel<T>> on RemoteAdapter<T> {
  @override
  String get baseUrl =>
      'https://stg-zero.propertyproplus.com.au/api/services/app/';
}

mixin FetchProductAdapter<T extends DataModel<T>> on RemoteAdapter<T> {
  @override
  Future<Map<String, String>> get defaultHeaders async {
    return {
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxOTIiLCJuYW1lIjoic2FtYWQiLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IkpYV0xONjdMSzc2S0xJS0lIQU9JQko1VEZQSlZOSkpEIiwicm9sZSI6IlZhbHVlciIsImh0dHA6Ly93d3cuYXNwbmV0Ym9pbGVycGxhdGUuY29tL2lkZW50aXR5L2NsYWltcy90ZW5hbnRJZCI6IjEwIiwiQXBwbGljYXRpb25fT3JnYW5pemF0aW9uVW5pdElkIjoidXNlckNhY2hlX3UxOTJfdDEwIiwianRpIjoiNmI0OGIyZDAtOTI1MS00MzZjLWE1YTktMTMzY2MzY2RhZDFlIiwiaWF0IjoxNzM3ODgxODExLCJ0b2tlbl92YWxpZGl0eV9rZXkiOiI3YmY0ZDEwNS1jM2NmLTQzODctOTU3Ny1jNDcyYTlhOGQ4YjQiLCJ1c2VyX2lkZW50aWZpZXIiOiIxOTJAMTAiLCJ0b2tlbl90eXBlIjoiMCIsIm5iZiI6MTczNzg4MTgxMSwiZXhwIjoxNzM3OTY4MjExLCJpc3MiOiJQcm9wZXJ0eVByb1BsdXMiLCJhdWQiOiJQcm9wZXJ0eVByb1BsdXMifQ.iKet1xrGve7g7QwhR_hCqvmrNkl5JJMn_8TlEVvgtcM',
      ...super.defaultHeaders as Map<String, String>,
    };
  }

  @override
  String get baseUrl => Environment.apiUrl;
  @override
  String get type => ApiEndpoints.getProducts;
}

mixin AddProductAdapter<T extends DataModel<T>> on RemoteAdapter<T> {
  @override
  Future<Map<String, String>> get defaultHeaders async {
    final defaultHeaders = await super.defaultHeaders;
    return {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxOTIiLCJuYW1lIjoic2FtYWQiLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IkpYV0xONjdMSzc2S0xJS0lIQU9JQko1VEZQSlZOSkpEIiwicm9sZSI6IlZhbHVlciIsImh0dHA6Ly93d3cuYXNwbmV0Ym9pbGVycGxhdGUuY29tL2lkZW50aXR5L2NsYWltcy90ZW5hbnRJZCI6IjEwIiwiQXBwbGljYXRpb25fT3JnYW5pemF0aW9uVW5pdElkIjoidXNlckNhY2hlX3UxOTJfdDEwIiwianRpIjoiNmI0OGIyZDAtOTI1MS00MzZjLWE1YTktMTMzY2MzY2RhZDFlIiwiaWF0IjoxNzM3ODgxODExLCJ0b2tlbl92YWxpZGl0eV9rZXkiOiI3YmY0ZDEwNS1jM2NmLTQzODctOTU3Ny1jNDcyYTlhOGQ4YjQiLCJ1c2VyX2lkZW50aWZpZXIiOiIxOTJAMTAiLCJ0b2tlbl90eXBlIjoiMCIsIm5iZiI6MTczNzg4MTgxMSwiZXhwIjoxNzM3OTY4MjExLCJpc3MiOiJQcm9wZXJ0eVByb1BsdXMiLCJhdWQiOiJQcm9wZXJ0eVByb1BsdXMifQ.iKet1xrGve7g7QwhR_hCqvmrNkl5JJMn_8TlEVvgtcM',
      ...defaultHeaders,
    };
  }

  @override
  String get baseUrl => Environment.apiUrl;

  @override
  String get type => ApiEndpoints.addProducts;
}
