// import 'package:play/model/area_response.dart';
// import 'package:play/network/dio/exceptions/network_exceptions.dart';
// import 'package:play/network/dio/http_client.dart';
// import 'package:play/network/dio/results/api_result.dart';
// import 'package:play/utils/constants.dart';

// class FootballApi {
//   final HTTPClient httpClient = HTTPClient(
//     baseURL: Constants.baseUrl,
//   );

//   Stream<ApiResult<AreaResponse>> getResourcePreload(
//       {Map<String, dynamic>? query}) async* {
//     yield const ApiResult.loading();
//     try {
//       final response = await httpClient.get("v4/competitions/PL", queryParameters: query, header: {
//         "X-Auth-Token": "fca8395bda144652b669924f533f7926",
//       });
//       yield ApiResult.success(data: AreaResponse.fromJson(response));
//     } catch (e) {
//       yield ApiResult.failure(error: NetworkExceptions.getDioException(e));
//     }
//   }
// }
