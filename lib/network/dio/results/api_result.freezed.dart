// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'api_result.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

// /// @nodoc
// mixin _$ApiResult<T> {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() loading,
//     required TResult Function(T? data) success,
//     required TResult Function(NetworkExceptions? error) failure,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? loading,
//     TResult? Function(T? data)? success,
//     TResult? Function(NetworkExceptions? error)? failure,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? loading,
//     TResult Function(T? data)? success,
//     TResult Function(NetworkExceptions? error)? failure,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Loading<T> value) loading,
//     required TResult Function(Success<T> value) success,
//     required TResult Function(Failure<T> value) failure,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Loading<T> value)? loading,
//     TResult? Function(Success<T> value)? success,
//     TResult? Function(Failure<T> value)? failure,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Loading<T> value)? loading,
//     TResult Function(Success<T> value)? success,
//     TResult Function(Failure<T> value)? failure,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $ApiResultCopyWith<T, $Res> {
//   factory $ApiResultCopyWith(
//           ApiResult<T> value, $Res Function(ApiResult<T>) then) =
//       _$ApiResultCopyWithImpl<T, $Res, ApiResult<T>>;
// }

// /// @nodoc
// class _$ApiResultCopyWithImpl<T, $Res, $Val extends ApiResult<T>>
//     implements $ApiResultCopyWith<T, $Res> {
//   _$ApiResultCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
// }

// /// @nodoc
// abstract class _$$LoadingCopyWith<T, $Res> {
//   factory _$$LoadingCopyWith(
//           _$Loading<T> value, $Res Function(_$Loading<T>) then) =
//       __$$LoadingCopyWithImpl<T, $Res>;
// }

// /// @nodoc
// class __$$LoadingCopyWithImpl<T, $Res>
//     extends _$ApiResultCopyWithImpl<T, $Res, _$Loading<T>>
//     implements _$$LoadingCopyWith<T, $Res> {
//   __$$LoadingCopyWithImpl(
//       _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
//       : super(_value, _then);
// }

// /// @nodoc

// class _$Loading<T> implements Loading<T> {
//   const _$Loading();

//   @override
//   String toString() {
//     return 'ApiResult<$T>.loading()';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is _$Loading<T>);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() loading,
//     required TResult Function(T? data) success,
//     required TResult Function(NetworkExceptions? error) failure,
//   }) {
//     return loading();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? loading,
//     TResult? Function(T? data)? success,
//     TResult? Function(NetworkExceptions? error)? failure,
//   }) {
//     return loading?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? loading,
//     TResult Function(T? data)? success,
//     TResult Function(NetworkExceptions? error)? failure,
//     required TResult orElse(),
//   }) {
//     if (loading != null) {
//       return loading();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Loading<T> value) loading,
//     required TResult Function(Success<T> value) success,
//     required TResult Function(Failure<T> value) failure,
//   }) {
//     return loading(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Loading<T> value)? loading,
//     TResult? Function(Success<T> value)? success,
//     TResult? Function(Failure<T> value)? failure,
//   }) {
//     return loading?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Loading<T> value)? loading,
//     TResult Function(Success<T> value)? success,
//     TResult Function(Failure<T> value)? failure,
//     required TResult orElse(),
//   }) {
//     if (loading != null) {
//       return loading(this);
//     }
//     return orElse();
//   }
// }

// abstract class Loading<T> implements ApiResult<T> {
//   const factory Loading() = _$Loading<T>;
// }

// /// @nodoc
// abstract class _$$SuccessCopyWith<T, $Res> {
//   factory _$$SuccessCopyWith(
//           _$Success<T> value, $Res Function(_$Success<T>) then) =
//       __$$SuccessCopyWithImpl<T, $Res>;
//   @useResult
//   $Res call({T? data});
// }

// /// @nodoc
// class __$$SuccessCopyWithImpl<T, $Res>
//     extends _$ApiResultCopyWithImpl<T, $Res, _$Success<T>>
//     implements _$$SuccessCopyWith<T, $Res> {
//   __$$SuccessCopyWithImpl(
//       _$Success<T> _value, $Res Function(_$Success<T>) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? data = freezed,
//   }) {
//     return _then(_$Success<T>(
//       data: freezed == data
//           ? _value.data
//           : data // ignore: cast_nullable_to_non_nullable
//               as T?,
//     ));
//   }
// }

// /// @nodoc

// class _$Success<T> implements Success<T> {
//   const _$Success({this.data});

//   @override
//   final T? data;

//   @override
//   String toString() {
//     return 'ApiResult<$T>.success(data: $data)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$Success<T> &&
//             const DeepCollectionEquality().equals(other.data, data));
//   }

//   @override
//   int get hashCode =>
//       Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
//       __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() loading,
//     required TResult Function(T? data) success,
//     required TResult Function(NetworkExceptions? error) failure,
//   }) {
//     return success(data);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? loading,
//     TResult? Function(T? data)? success,
//     TResult? Function(NetworkExceptions? error)? failure,
//   }) {
//     return success?.call(data);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? loading,
//     TResult Function(T? data)? success,
//     TResult Function(NetworkExceptions? error)? failure,
//     required TResult orElse(),
//   }) {
//     if (success != null) {
//       return success(data);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Loading<T> value) loading,
//     required TResult Function(Success<T> value) success,
//     required TResult Function(Failure<T> value) failure,
//   }) {
//     return success(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Loading<T> value)? loading,
//     TResult? Function(Success<T> value)? success,
//     TResult? Function(Failure<T> value)? failure,
//   }) {
//     return success?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Loading<T> value)? loading,
//     TResult Function(Success<T> value)? success,
//     TResult Function(Failure<T> value)? failure,
//     required TResult orElse(),
//   }) {
//     if (success != null) {
//       return success(this);
//     }
//     return orElse();
//   }
// }

// abstract class Success<T> implements ApiResult<T> {
//   const factory Success({final T? data}) = _$Success<T>;

//   T? get data;
//   @JsonKey(ignore: true)
//   _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$FailureCopyWith<T, $Res> {
//   factory _$$FailureCopyWith(
//           _$Failure<T> value, $Res Function(_$Failure<T>) then) =
//       __$$FailureCopyWithImpl<T, $Res>;
//   @useResult
//   $Res call({NetworkExceptions? error});

//   $NetworkExceptionsCopyWith<$Res>? get error;
// }

// /// @nodoc
// class __$$FailureCopyWithImpl<T, $Res>
//     extends _$ApiResultCopyWithImpl<T, $Res, _$Failure<T>>
//     implements _$$FailureCopyWith<T, $Res> {
//   __$$FailureCopyWithImpl(
//       _$Failure<T> _value, $Res Function(_$Failure<T>) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? error = freezed,
//   }) {
//     return _then(_$Failure<T>(
//       error: freezed == error
//           ? _value.error
//           : error // ignore: cast_nullable_to_non_nullable
//               as NetworkExceptions?,
//     ));
//   }

//   @override
//   @pragma('vm:prefer-inline')
//   $NetworkExceptionsCopyWith<$Res>? get error {
//     if (_value.error == null) {
//       return null;
//     }

//     return $NetworkExceptionsCopyWith<$Res>(_value.error!, (value) {
//       return _then(_value.copyWith(error: value));
//     });
//   }
// }

// /// @nodoc

// class _$Failure<T> implements Failure<T> {
//   const _$Failure({this.error});

//   @override
//   final NetworkExceptions? error;

//   @override
//   String toString() {
//     return 'ApiResult<$T>.failure(error: $error)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$Failure<T> &&
//             (identical(other.error, error) || other.error == error));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, error);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$FailureCopyWith<T, _$Failure<T>> get copyWith =>
//       __$$FailureCopyWithImpl<T, _$Failure<T>>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() loading,
//     required TResult Function(T? data) success,
//     required TResult Function(NetworkExceptions? error) failure,
//   }) {
//     return failure(error);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? loading,
//     TResult? Function(T? data)? success,
//     TResult? Function(NetworkExceptions? error)? failure,
//   }) {
//     return failure?.call(error);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? loading,
//     TResult Function(T? data)? success,
//     TResult Function(NetworkExceptions? error)? failure,
//     required TResult orElse(),
//   }) {
//     if (failure != null) {
//       return failure(error);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(Loading<T> value) loading,
//     required TResult Function(Success<T> value) success,
//     required TResult Function(Failure<T> value) failure,
//   }) {
//     return failure(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(Loading<T> value)? loading,
//     TResult? Function(Success<T> value)? success,
//     TResult? Function(Failure<T> value)? failure,
//   }) {
//     return failure?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(Loading<T> value)? loading,
//     TResult Function(Success<T> value)? success,
//     TResult Function(Failure<T> value)? failure,
//     required TResult orElse(),
//   }) {
//     if (failure != null) {
//       return failure(this);
//     }
//     return orElse();
//   }
// }

// abstract class Failure<T> implements ApiResult<T> {
//   const factory Failure({final NetworkExceptions? error}) = _$Failure<T>;

//   NetworkExceptions? get error;
//   @JsonKey(ignore: true)
//   _$$FailureCopyWith<T, _$Failure<T>> get copyWith =>
//       throw _privateConstructorUsedError;
// }
