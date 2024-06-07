abstract class FilterBase {
  String? _order;
  String? _sortBy;
  String? _search;

  String? get ordering => _order;
  String? get brand => _sortBy;
  String? get search => _search;

  void setBrand(String? value) {
    _sortBy = value;
  }

  void setOrdering(String value) {
    _order = value;
  }

  void setSearch(String? value) {
    _search = value;
  }

  void reset() {
    _order = null;
    _sortBy = null;
    _search = null;
  }
}
