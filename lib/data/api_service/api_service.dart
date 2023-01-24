import 'package:dio/dio.dart';
import 'package:provider_example/data/models/my_response/response_model.dart';
import 'package:provider_example/data/models/users_cards_model.dart';

import 'api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCards() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = (response.data as List?)
                ?.map((e) => UsersCardsModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }
}
