class FilterModel {
  String? order;
  String? sort;

  FilterModel({
    this.order,
    this.sort,
  });

  Map<String, dynamic> toMap() {
    return {
      'order': order,
      'sortBy': sort,
    };
  }
}
