class PostResponse {
  final int? value;
  final String? error;

  PostResponse({this.value, this.error});

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      value: json['value'],
      error: json['StatusCode'],
    );
  }
}
