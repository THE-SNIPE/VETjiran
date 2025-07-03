import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineCacheService {
  static const String _knowledgeHubCacheKey = 'knowledge_hub_cache';

  // Save knowledge hub content JSON string to local storage
  static Future<void> cacheKnowledgeHubContent(String jsonContent) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_knowledgeHubCacheKey, jsonContent);
  }

  // Retrieve cached knowledge hub content JSON string from local storage
  static Future<String?> getCachedKnowledgeHubContent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_knowledgeHubCacheKey);
  }

  // Clear cached knowledge hub content
  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_knowledgeHubCacheKey);
  }
}
