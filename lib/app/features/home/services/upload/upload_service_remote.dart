import 'dart:io';

import 'package:app_test_fiap/app/core/client/api_client.dart';
import 'package:app_test_fiap/app/core/network/response_types/response.dart';
import 'package:app_test_fiap/app/features/home/services/upload/upload_service.dart';
import 'package:dio/dio.dart' hide Response;

class UploadServiceRemote implements UploadService {
  @override
  Future<({String? imageUrl, Response result})> uploadImage(File imageFile) async {
    try {
      final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
    });
    
    final result = await ApiClient.client.post(
      '/api/v1/files/upload',
      data: form,
    );

    return (imageUrl: result.data['location'] as String?, result: const Success());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return (
          imageUrl: null,
          result: const GeneralFailure(message: 'Erro nos dados enviados'),
        );
      } else if (e.response?.statusCode == 404) {
        return (
          imageUrl: null,
          result: const GeneralFailure(message: 'Produto não encontrado'),
        );
      } else {
        return (
          imageUrl: null,
          result: const GeneralFailure(message: 'Erro indefinido'),
        );
      }
    } 
    catch (e) {
      return (imageUrl: null, result: const GeneralFailure());
    }
  }

}