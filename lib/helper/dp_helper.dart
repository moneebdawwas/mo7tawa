import 'package:majlaat/models/my_files_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DpHelper {
  static final DpHelper _instense = DpHelper.internal();
  factory DpHelper() => _instense;
  DpHelper.internal();
  static Database? _dp;

  Future<Database?> createDatabase() async {
    if (_dp != null) {
      return _dp;
    }
    // define the path to database

    String path = join(await getDatabasesPath(), 'homeData');
    _dp = await openDatabase(path, version: 1, onCreate: initDB);
    return _dp;
  }

  initDB(Database dp, int version) {
    // Create Tables
    dp.execute(
        'create table categories(id integer primary key autoincrement, thumbnail varchar(50), type varchar(50), url varchar(50), title varchar(50))');
  }

  Future<int> createCategories(MyFileModel myFileModel) async {
    Database? dp = await createDatabase();
    return dp!.insert(
      'categories',
      myFileModel.toJson(),
    );
  }

  Future<List?> allCategories() async {
    Database? dp = await createDatabase();
    return dp!.query('categories');
  }

  Future<int?> delete(int id) async {
    Database? dp = await createDatabase();
    return dp!.delete('categories', where: 'id = ?', whereArgs: [id]);
  }
}
