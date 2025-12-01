import '../models/databasehelper.dart';
import '../models/item.dart';
import '../models/user.dart';
import '../models/fridge.dart';

class DebugDatabaseController {
  // Returns a map of table name to row count
  Future<Map<String, int>> getTableRowCounts() async {
    final db = await FridgeDatabaseHelper.instance.db;
    // Get list of tables
    final tables = await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    Map<String, int> result = {};
    for (var row in tables) {
      final tableName = row['name'] as String;
      // Skip sqlite_sequence which is internal
      if (tableName == 'sqlite_sequence') continue;
      final countResult = await db.rawQuery('SELECT COUNT(*) as cnt FROM $tableName');
      final count = countResult.first['cnt'] as int;
      result[tableName] = count;
    }
    return result;
  }

  // Returns all rows for a given table
  Future<List<Map<String, dynamic>>> getAllRows(String tableName) async {
    final db = await FridgeDatabaseHelper.instance.db;
    return await db.query(tableName);
  }
}
