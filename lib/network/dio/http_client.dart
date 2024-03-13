import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/retry.dart';

class HTTPClient {
  late String baseURL;

  HTTPClient({required this.baseURL});
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? header,
  }) async {
    try {
      String method = 'GET';
      String queryString = mapToQueryString(queryParameters);

      debugPrint(
          "URL ==> ${Uri.parse(baseURL + path + queryString).toString()}");
      debugPrint("DATA ==> ${jsonEncode(queryParameters)}");
      var request =
          http.Request(method, Uri.parse(baseURL + path + queryString));
      if (header != null) {
        request.headers.addAll(header);
      }
      http.StreamedResponse response = await request.send();
      var model = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(model);
      debugPrint("Response From Http : ${jsonMap.toString()}");
      debugPrint("Status Code ${response.statusCode.toString()}");
      return jsonMap;
    } on SocketException catch (e) {
      debugPrint("SocketException : $e");
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      debugPrint("FormatException : $e");
      throw FormatException("Unable to process the data: ${e.message}");
    } on Exception catch (e) {
      debugPrint("catch : $e");
      rethrow;
    }
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      String method = 'POST';
      var request = http.Request(
        method,
        Uri.parse(baseURL + path),
      );
      if (body != null) {
        request.body = json.encode(body);
      }
      if (header != null) {
        request.headers.addAll(header);
      }
      debugPrint("Method ==> $method");
      debugPrint("URL ==> ${baseURL + path}");
      debugPrint("Header ==> ${jsonEncode(request.headers)}");
      debugPrint("DATA ==> ${request.body}");
      var client = RetryClient(
        http.Client(),
      );
      http.StreamedResponse response = await client.send(request);
      var model = await response.stream.bytesToString();
      debugPrint("Response From Https : $model");
      dynamic jsonResponse;
      if (model != "") {
        jsonResponse = json.decode(model);
      } else {
        jsonResponse = "Empty";
      }
      debugPrint("Status Code ${response.statusCode.toString()}");

      return jsonResponse;
    } on SocketException catch (e) {
      debugPrint("SocketException : $e");
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      debugPrint("FormatException : $e");
      throw FormatException("Unable to process the data: ${e.message}");
    } catch (e) {
      debugPrint("catch : $e");
      rethrow;
    }
  }
}

String mapToQueryString(Map<String, dynamic>? map) {
  String queryString = '';
  map?.forEach((key, value) {
    if (queryString.isNotEmpty) {
      queryString += '&';
    }
    queryString += '$key=$value';
  });
  return queryString;
}

Future<void> retryRequest() async {}
