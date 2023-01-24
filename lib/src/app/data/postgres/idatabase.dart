abstract class IDatabase {
  Future<List<Map<String, Map<String, dynamic>>>> databaseQuery(
      String query, {Map<String, dynamic> variables});
}
