import 'package:dio/src/response.dart';
import 'package:flutter_getx_template/app/core/model/github_search_query_param.dart';
import 'package:flutter_getx_template/app/data/remote/github_remote_data_source.dart';
import 'package:flutter_getx_template/app/core/base/base_remote_source.dart';
import 'package:flutter_getx_template/app/network/dio_provider.dart';

class GithubRemoteDataSourceImpl extends BaseRemoteSource
    implements GithubRemoteDataSource {
  @override
  Future<void> searchGithubRepository(GithubSearchQueryParam queryParam) async {
    var endpoint = "${DioProvider.baseUrl}/search/repositories";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());

    try {
      var response = await callApiWithErrorParser(dioCall);

      return _parseGithubSearchResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void getGithubRepositoryDetails(String userName, String repositoryName) {
    var endpoint = "${DioProvider.baseUrl}/repos/$userName/$repositoryName";
    var dioCall = dioClient.get(endpoint);
  }

  _parseGithubSearchResponse(Response<dynamic> response) {

  }
}
