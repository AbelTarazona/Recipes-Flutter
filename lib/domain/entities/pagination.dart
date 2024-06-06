class Pagination<T> {
  final int total;
  final int skip;
  final int limit;
  final List<T> data;

  Pagination({
    required this.total,
    required this.skip,
    required this.limit,
    required this.data,
  });
}
