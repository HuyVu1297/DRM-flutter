import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:drappnpc/Data/Data.dart';

class DSThoaThuanKHPage extends StatefulWidget {
  @override
  _DSThoaThuanKHPageState createState() => _DSThoaThuanKHPageState();
}

class _DSThoaThuanKHPageState extends State<DSThoaThuanKHPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Danh sách thỏa thuận khách hàng',),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}