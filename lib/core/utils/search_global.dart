import 'package:recipes_aplazo/core/utils/filter_base.dart';

class SearchGlobal extends FilterBase {
  static SearchGlobal get instance => _instance;

  static final SearchGlobal _instance = SearchGlobal._internal();

  factory SearchGlobal() => _instance;

  SearchGlobal._internal();
}
