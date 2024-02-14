import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> postName(String name) async {
  Map<String, String> request = {"name": name};
  final uri = Uri.parse('https://freefile.onrender.com/created');
  final response = await http.post(uri, body: request);
  if (response.statusCode == 200) {
    debugPrint("Succeful send");
  } else {
    throw Exception('Fail to load post');
  }
}

Future<void> postCreditId(String uid) async {
  Map<String, dynamic> request = {"credit": 0, "author": uid};
  final uri = Uri.parse('https://freefile.onrender.com/credit');
  final response = await http.post(uri, body: request);

  if (response.statusCode == 200) {
    debugPrint("Succeful send");
  } else {
    throw Exception('Fail to load post');
  }
}

Future<String> getUrl() async {
  //* Information: Cette methode permet d'obtenir l'url d'un fichier sockips*/
  final uri = Uri.parse('https://freefile.onrender.com/sockips');
//  try {
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data['url'];
  } else {
    throw Exception('Fail to load get');
  }
  // } catch (e) {
  //   debugPrint(e.toString());
  // }
  // return '';
}

Future<String> getUrlCustom() async {
  final uri = Uri.parse('https://freefile.onrender.com/custom');
  // try {
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data['url'];
  } else {
    throw Exception('Fail to load get');
  }
  //} catch (e) {
  //   debugPrint(e.toString());
//  }
  // return '';
}

Future<String> getUrlInjector() async {
  final uri = Uri.parse('https://freefile.onrender.com/injector');
  //s try {
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data['url'];
  } else {
    throw Exception('Fail to load get');
  }
  // } catch (e) {
  //   debugPrint(e.toString());
  // }
  // return '';
}

Future<String> getUrlTunnel() async {
  final uri = Uri.parse('https://freefile.onrender.com/tunnel');

  //By PT Germann
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data['url'];
  } else {
    throw Exception('Fail to load get');
  }
}

Future<String> getTextCustom() async {
  final uri = Uri.parse('https://freefile.onrender.com/message');
  //s try {
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data['message'];
  } else {
    return "";
  }
  // } catch (e) {
  //   debugPrint(e.toString());
  // }
  // return '';
}

