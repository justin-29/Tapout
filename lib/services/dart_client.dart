import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://flutternotication.herokuapp.com';
  // final _baseUrl = 'http://192.168.29.74:3000';

  Future sendNotification(
      {required String title, required String reason}) async {
    var params = {"title": title, "body": reason};

    Response response =
        await _dio.post(_baseUrl + "/notification", data: params);

    print("[RESPPOSNE ] $response");
  }
}
