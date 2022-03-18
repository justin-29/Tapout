import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://flutternotication.herokuapp.com';

  Future sendNotification(
      {required String title, required String reason}) async {
    var params = {"title": title, "body": reason};

    Response response =
        await _dio.put(_baseUrl + "/notification", data: params);

    print("[RESPPOSNE ] $response");
  }
}
