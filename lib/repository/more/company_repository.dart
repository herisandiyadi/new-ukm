

import 'package:ukm_desk_app/api_helper/apiBaseHelper.dart';
import 'package:ukm_desk_app/constants.dart';
import 'package:ukm_desk_app/model/response/more/company_responses.dart';
import 'package:ukm_desk_app/util/cache_util.dart';
import 'package:http/http.dart' as http;

class CompanyRepository {
  ApiBaseHelper _helper = ApiBaseHelper();
  @override
  // Future<List<CompanyResponse>> getListCompany() async {
  //   // final response = await _helper.getWibi(
  //   //   "perusahaan",
  //   //   await CacheUtil.getString(CACHE_TOKEN_WIBI),
  //   // );
  //   // print(await CacheUtil.getString(CACHE_TOKEN_WIBI));
  //   final token = await CacheUtil.getString(CACHE_TOKEN);
  //   print(token);
  //   // final resp = await http.get(BASE_URL_WIBI + 'perusahaan', headers: {
  //   //   'Authorization': "bearer " + token,
  //   // });
  //   // print(resp);

  //   try {
  //     // final uri = Uri.http(
  //     //     BASE_URL_WIBI, 'perusahaan', {"Authorization": "bearer $token"});
  //     Uri urlWibi = host
  //     Map<String, String> header = {
  //       "Authorization": "Bearer $token",
  //     };
  //     final response = await http.get(Uri(), headers: header);
  //     final json = jsonDecode(response.body);
  //     final jsonArray = json['data'] as List;
  //     if (response.statusCode == 200) {
  //       final companies =
  //           jsonArray.map((e) => CompanyResponse.fromJson(json)).toList();
  //       return companies;
  //     } else {
  //       throw Exception('Failed to load data Company');
  //     }
  //     // final posts = json.map((data) => Datum.fromJson(data)).toList();
  //     // print(json);
  //     // return json;
  //     // print(json);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<List<Datum>> getData() async {
  //   final token = await CacheUtil.getString(CACHE_TOKEN);
  //   print('data tokenwibi : $token');

  //   final headers = {
  //     'Authorization': 'bearer $token',
  //   };

  //   // var request = http.Request(
  //   //     'GET', Uri.parse('http://enforcea.wibidigital.com/api/perusahaan'));

  //   final reqData = await http.get(
  //       'http://enforcea.wibidigital.com/api/perusahaan',
  //       headers: headers);
  //   // request.headers.addAll(headers);

  //   // http.StreamedResponse response = await request.send();
  //   print('wibidi $reqData');

  //   // final resp = await response.stream.bytesToString();
  //   final respo = jsonDecode(reqData.body);
  //   final dataResp = respo['data'];
  //   List<Datum> datums = [];
  //   for (var item in dataResp) {
  //     Datum datum = Datum(
  //         id: item['id'],
  //         name: item['name'],
  //         npwp: item['npwp'],
  //         endTime: item['endTime'],
  //         address: item['address']);
  //     datums.add(datum);
  //   }

  //   print(datums.length);
  //   return datums;
  // }

  Future<void> selectCompany(String id) async {
    final token = await CacheUtil.getString(CACHE_TOKEN);

    final headers = {
      'Authorization': 'bearer $token',
    };
    final body = {'perusahaan_id': id};
    final responseData = await http.post(
        URL,
        headers: headers,
        body: body);
  }

  Future<void> addCompany(String name, String npwp, String address) async {
    final token = await CacheUtil.getString(CACHE_TOKEN);

    final headers = {
      'Authorization': 'bearer $token',
    };
    final body =
        json.encode({"name": "$name", "npwp": '$npwp', "address": '$address'});
    final responseData = await http.post(
        'http://enforcea.wibidigital.com/api/add_perusahaan',
        headers: headers,
        body: body);
    print(body);
    print(responseData.body);
  }
}
