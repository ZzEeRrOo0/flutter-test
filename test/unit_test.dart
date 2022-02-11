import 'package:morphosis_flutter_demo/non_ui/datasource/home_remote_datasource.dart';
import 'package:test/test.dart';

void main() {
  HomeRemoteDataSourceImpl homeRemoteDataSourceImpl = HomeRemoteDataSourceImpl();
  group('Get data', () {
    test('Get data success', () async {
      final data = await homeRemoteDataSourceImpl.getListSong();
      expect(data, isNotNull);
    });
  });
}