class PaginationModel<T> {
  final int total;
  final int skip;
  final int limit;
  final List<T> data;

  PaginationModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.data,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) create,
  ) {
    return PaginationModel<T>(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      data: json['recipes'] != null
          ? List<T>.from(json['recipes'].map((x) => create(x)))
          : [],
    );
  }
}
