// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:helpers/dio/dio_headers.dart';
import 'package:helpers/tokens/tokens.dart';

///this class is used with 'Remote Data Source class' to make api calls
///contains following methods 'get','post','patch','delete',put.
class DioHelper {
//will take a dio instance when initalizing the diohelper object in service locator class
  late final Dio _dio;
  //the base url no final because we can use it with searchin in google map
  String baseUrl = '';
  void _addInterceptors() => _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // print request data
          print("Data: ${options.data}");
          print("Request: ${options.method} ${options.path}");
          print("Headers: ${options.headers}");
          print("Quiries: ${options.queryParameters}");
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          print("object : $response");
          // print response data
          print("Response: ${response.statusCode} ${response.data}");
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          // print error
          print("object  Error: ${e.response}");
          print("Error: ${e}");

          print("Error: ${e.message}");

          print("Error: ${e.response?.statusCode} ${e.response?.data}");
          return handler.next(e); //continue
        },
      ));

  DioHelper(this._dio) {
    _addInterceptors();
    _dio.options.baseUrl = baseUrl;
  }

  ///fetch some data and return the response wether success of failure
  ///param [endPoint] string indicates which end point we wanna hit
  Future<Response> get(
      {required String endPoint, Map<String, dynamic>? q}) async {
    try {
      //start the request by concatinaing the basurl with the given end point
      //check if the 'TokensHelper' has cached tokens if it's found then pass the auth header to the headers
      final response = await _dio.get(endPoint,
          queryParameters: q,
          options: Options(headers: {
            if (await TokensHelper.hasTokens()) ...await getAuthHeader(),
            ...await getLangHeader()
          }));

      return response;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(),
        error: error.toString(),
      );
    }
  }

  Future<Map<String, dynamic>> getAuthHeader() async => Future.value(
      DioHeaders.authorizationHeader((await TokensHelper.get()).access));

  Future<Map<String, dynamic>> getLangHeader() async =>
      await DioHeaders.languageHeader();

  ///post some data and return the response wether success of failure
  ///param [endPoint] string indicates which end point we wanna hit
  ///[data] 'Map<String, dynamic>' the data to post it
  Future<Response> post(
      {required String endPoint,
      required Map<String, dynamic> data,
      Map<String, dynamic>? q}) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
        queryParameters: q,
        options: Options(
          headers: {
            if (await TokensHelper.hasTokens()) ...await getAuthHeader(),
            ...await getLangHeader()
          },
        ),
      );

      return response;
    } on DioException catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endPoint),
        error: error.response,
      );
    }
  }

  Future<Response> postFormData({
    required String endPoint,
    required FormData data,
  }) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
        options: Options(
          headers: {
            if (await TokensHelper.hasTokens()) ...await getAuthHeader(),
            ..._formDataHeader,
            ...await getLangHeader()
          },
        ),
      );
      return response;
    } on DioException catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endPoint),
        error: error.response,
      );
    }
  }

  Future<Response> patchFormData({
    required String endPoint,
    required FormData data,
  }) async {
    try {
      final response = await _dio.patch(
        endPoint,
        data: data,
        options: Options(
          headers: {
            if (await TokensHelper.hasTokens()) ...await getAuthHeader(),
            ..._formDataHeader,
            ...await getLangHeader()
          },
        ),
      );
      return response;
    } on DioException catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endPoint),
        error: error.response,
      );
    }
  }

  get _formDataHeader => {'Content-Type': 'multipart/form-data'};

  ///post some data and return the response wether success of failure
  ///param [endPoint] string indicates which end point we wanna hit
  ///[data] 'Map<String, dynamic>' the data to edit it

  Future<Response> patch(
      {required String endPoint, required Map<String, dynamic> data}) async {
    try {
      final response = await _dio.patch(endPoint,
          data: data,
          options: Options(headers: {
            if (await TokensHelper.hasTokens()) ...await getAuthHeader(),
            ...await getLangHeader()
          }));
      return response;
    } on DioException catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endPoint),
        error: error.response.toString(),
      );
    }
  }

  ///post some data and return the response wether success of failure
  ///param [endPoint] string indicates which end point we wanna hit

  Future<Response> delete({required String endPoint}) async {
    try {
      final response = await _dio.delete(
        endPoint,
        options: Options(
          headers: {
            if (await TokensHelper.hasTokens()) ...await getAuthHeader(),
            ...await getLangHeader()
          },
        ),
      );
      return response;
    } on DioException catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endPoint),
        error: error.response.toString(),
      );
    }
  }

  Future<Response> put(
      {required String endPoint, required Map<String, dynamic> data}) async {
    try {
      final response = await _dio.put(endPoint,
          data: data,
          options: Options(headers: {
            if (await TokensHelper.hasTokens()) ...await getAuthHeader(),
            ...await getLangHeader()
          }));
      return response;
    } on DioException catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endPoint),
        error: error.response.toString(),
      );
    }
  }

  Future<Response> putFormData(
      {required String endPoint, required FormData data}) async {
    try {
      final response = await _dio.put(endPoint,
          data: data,
          options: Options(headers: {
            if (await TokensHelper.hasTokens()) ...await getAuthHeader(),
            ...await getLangHeader(),
            ..._formDataHeader
          }));
      return response;
    } on DioException catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: endPoint),
        error: error.response.toString(),
      );
    }
  }
}
