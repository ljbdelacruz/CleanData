class StandardResponse {
  bool success;
  String message;
  dynamic data;

  StandardResponse(this.message, this.data, {this.success=false});
  StandardResponse.fromJson(Map<String, dynamic> json){
    this.message = json["message"];
    data = json["data"];
    this.success=json["success"];
  }
  StandardResponse.fromJsonErr(Map<String, dynamic> json){
    this.message = json["message"];
    this.success=json["success"];
  }

}
