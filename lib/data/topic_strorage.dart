import 'dart:convert';

import 'package:demoapp/data/model/topic.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract class TopicStorage {
  Future<List<Topic>> Load();
}

class AssetTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> Load() async {
    if (kDebugMode) {
      await Future.delayed(const Duration(seconds: 1));
    }
    final jsonContent = await rootBundle.loadString("mock/topics/topics.json");
    final List<dynamic> jsonData = jsonDecode(jsonContent);
    return jsonData.map((e) => Topic.fromJson(e)).toList();
  }
}
