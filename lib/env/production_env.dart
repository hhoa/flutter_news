import 'base.dart';

class ProductionEnviroment implements IEnviroment {
  final String description = 'News Production';
  final String domain = 'newsapi.org';
  final String subPath = 'v2';
}
