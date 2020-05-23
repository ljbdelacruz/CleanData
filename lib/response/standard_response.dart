class StandardResponse {
  final String message;
  final dynamic data;

  StandardResponse(this.message, this.data);

  StandardResponse.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        data = json["data"];
}
