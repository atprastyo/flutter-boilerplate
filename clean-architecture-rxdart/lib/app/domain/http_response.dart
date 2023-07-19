class HttpResponse {
  int statusCode = 200;
  String message = "";
  dynamic data;

  HttpResponse({ required this.statusCode, required this.message, this.data });
}
