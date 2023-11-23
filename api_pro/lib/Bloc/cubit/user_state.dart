import 'package:api_pro/network_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idel() = Idel<T>;
  const factory ResultState.loading(T data) = Loading<T>;
  const factory ResultState.error(NetworkExceptions e) = Error<T>;
}
