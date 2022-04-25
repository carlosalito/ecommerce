class PageInfoResponse {
  final int totalPages;
  final int totalRows;

  PageInfoResponse({required this.totalPages, required this.totalRows});
}

class ResponseList<T> {
  final PageInfoResponse pageInfo;
  final List<T> data;

  ResponseList({required this.data, required this.pageInfo});
}
