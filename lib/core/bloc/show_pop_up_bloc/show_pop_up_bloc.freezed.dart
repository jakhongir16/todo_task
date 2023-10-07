// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show_pop_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShowPopUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) showWarning,
    required TResult Function(String text) showSuccess,
    required TResult Function(String text) showFailure,
    required TResult Function() hide,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? showWarning,
    TResult? Function(String text)? showSuccess,
    TResult? Function(String text)? showFailure,
    TResult? Function()? hide,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? showWarning,
    TResult Function(String text)? showSuccess,
    TResult Function(String text)? showFailure,
    TResult Function()? hide,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowWarning value) showWarning,
    required TResult Function(_ShowSuccess value) showSuccess,
    required TResult Function(_ShowFailure value) showFailure,
    required TResult Function(_Hide value) hide,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowWarning value)? showWarning,
    TResult? Function(_ShowSuccess value)? showSuccess,
    TResult? Function(_ShowFailure value)? showFailure,
    TResult? Function(_Hide value)? hide,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowWarning value)? showWarning,
    TResult Function(_ShowSuccess value)? showSuccess,
    TResult Function(_ShowFailure value)? showFailure,
    TResult Function(_Hide value)? hide,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowPopUpEventCopyWith<$Res> {
  factory $ShowPopUpEventCopyWith(
          ShowPopUpEvent value, $Res Function(ShowPopUpEvent) then) =
      _$ShowPopUpEventCopyWithImpl<$Res, ShowPopUpEvent>;
}

/// @nodoc
class _$ShowPopUpEventCopyWithImpl<$Res, $Val extends ShowPopUpEvent>
    implements $ShowPopUpEventCopyWith<$Res> {
  _$ShowPopUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShowWarningImplCopyWith<$Res> {
  factory _$$ShowWarningImplCopyWith(
          _$ShowWarningImpl value, $Res Function(_$ShowWarningImpl) then) =
      __$$ShowWarningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$ShowWarningImplCopyWithImpl<$Res>
    extends _$ShowPopUpEventCopyWithImpl<$Res, _$ShowWarningImpl>
    implements _$$ShowWarningImplCopyWith<$Res> {
  __$$ShowWarningImplCopyWithImpl(
      _$ShowWarningImpl _value, $Res Function(_$ShowWarningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$ShowWarningImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowWarningImpl implements _ShowWarning {
  _$ShowWarningImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'ShowPopUpEvent.showWarning(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowWarningImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowWarningImplCopyWith<_$ShowWarningImpl> get copyWith =>
      __$$ShowWarningImplCopyWithImpl<_$ShowWarningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) showWarning,
    required TResult Function(String text) showSuccess,
    required TResult Function(String text) showFailure,
    required TResult Function() hide,
  }) {
    return showWarning(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? showWarning,
    TResult? Function(String text)? showSuccess,
    TResult? Function(String text)? showFailure,
    TResult? Function()? hide,
  }) {
    return showWarning?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? showWarning,
    TResult Function(String text)? showSuccess,
    TResult Function(String text)? showFailure,
    TResult Function()? hide,
    required TResult orElse(),
  }) {
    if (showWarning != null) {
      return showWarning(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowWarning value) showWarning,
    required TResult Function(_ShowSuccess value) showSuccess,
    required TResult Function(_ShowFailure value) showFailure,
    required TResult Function(_Hide value) hide,
  }) {
    return showWarning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowWarning value)? showWarning,
    TResult? Function(_ShowSuccess value)? showSuccess,
    TResult? Function(_ShowFailure value)? showFailure,
    TResult? Function(_Hide value)? hide,
  }) {
    return showWarning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowWarning value)? showWarning,
    TResult Function(_ShowSuccess value)? showSuccess,
    TResult Function(_ShowFailure value)? showFailure,
    TResult Function(_Hide value)? hide,
    required TResult orElse(),
  }) {
    if (showWarning != null) {
      return showWarning(this);
    }
    return orElse();
  }
}

abstract class _ShowWarning implements ShowPopUpEvent {
  factory _ShowWarning({required final String text}) = _$ShowWarningImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$ShowWarningImplCopyWith<_$ShowWarningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowSuccessImplCopyWith<$Res> {
  factory _$$ShowSuccessImplCopyWith(
          _$ShowSuccessImpl value, $Res Function(_$ShowSuccessImpl) then) =
      __$$ShowSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$ShowSuccessImplCopyWithImpl<$Res>
    extends _$ShowPopUpEventCopyWithImpl<$Res, _$ShowSuccessImpl>
    implements _$$ShowSuccessImplCopyWith<$Res> {
  __$$ShowSuccessImplCopyWithImpl(
      _$ShowSuccessImpl _value, $Res Function(_$ShowSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$ShowSuccessImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowSuccessImpl implements _ShowSuccess {
  _$ShowSuccessImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'ShowPopUpEvent.showSuccess(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowSuccessImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowSuccessImplCopyWith<_$ShowSuccessImpl> get copyWith =>
      __$$ShowSuccessImplCopyWithImpl<_$ShowSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) showWarning,
    required TResult Function(String text) showSuccess,
    required TResult Function(String text) showFailure,
    required TResult Function() hide,
  }) {
    return showSuccess(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? showWarning,
    TResult? Function(String text)? showSuccess,
    TResult? Function(String text)? showFailure,
    TResult? Function()? hide,
  }) {
    return showSuccess?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? showWarning,
    TResult Function(String text)? showSuccess,
    TResult Function(String text)? showFailure,
    TResult Function()? hide,
    required TResult orElse(),
  }) {
    if (showSuccess != null) {
      return showSuccess(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowWarning value) showWarning,
    required TResult Function(_ShowSuccess value) showSuccess,
    required TResult Function(_ShowFailure value) showFailure,
    required TResult Function(_Hide value) hide,
  }) {
    return showSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowWarning value)? showWarning,
    TResult? Function(_ShowSuccess value)? showSuccess,
    TResult? Function(_ShowFailure value)? showFailure,
    TResult? Function(_Hide value)? hide,
  }) {
    return showSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowWarning value)? showWarning,
    TResult Function(_ShowSuccess value)? showSuccess,
    TResult Function(_ShowFailure value)? showFailure,
    TResult Function(_Hide value)? hide,
    required TResult orElse(),
  }) {
    if (showSuccess != null) {
      return showSuccess(this);
    }
    return orElse();
  }
}

abstract class _ShowSuccess implements ShowPopUpEvent {
  factory _ShowSuccess({required final String text}) = _$ShowSuccessImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$ShowSuccessImplCopyWith<_$ShowSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowFailureImplCopyWith<$Res> {
  factory _$$ShowFailureImplCopyWith(
          _$ShowFailureImpl value, $Res Function(_$ShowFailureImpl) then) =
      __$$ShowFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$ShowFailureImplCopyWithImpl<$Res>
    extends _$ShowPopUpEventCopyWithImpl<$Res, _$ShowFailureImpl>
    implements _$$ShowFailureImplCopyWith<$Res> {
  __$$ShowFailureImplCopyWithImpl(
      _$ShowFailureImpl _value, $Res Function(_$ShowFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$ShowFailureImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowFailureImpl implements _ShowFailure {
  _$ShowFailureImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'ShowPopUpEvent.showFailure(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowFailureImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowFailureImplCopyWith<_$ShowFailureImpl> get copyWith =>
      __$$ShowFailureImplCopyWithImpl<_$ShowFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) showWarning,
    required TResult Function(String text) showSuccess,
    required TResult Function(String text) showFailure,
    required TResult Function() hide,
  }) {
    return showFailure(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? showWarning,
    TResult? Function(String text)? showSuccess,
    TResult? Function(String text)? showFailure,
    TResult? Function()? hide,
  }) {
    return showFailure?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? showWarning,
    TResult Function(String text)? showSuccess,
    TResult Function(String text)? showFailure,
    TResult Function()? hide,
    required TResult orElse(),
  }) {
    if (showFailure != null) {
      return showFailure(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowWarning value) showWarning,
    required TResult Function(_ShowSuccess value) showSuccess,
    required TResult Function(_ShowFailure value) showFailure,
    required TResult Function(_Hide value) hide,
  }) {
    return showFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowWarning value)? showWarning,
    TResult? Function(_ShowSuccess value)? showSuccess,
    TResult? Function(_ShowFailure value)? showFailure,
    TResult? Function(_Hide value)? hide,
  }) {
    return showFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowWarning value)? showWarning,
    TResult Function(_ShowSuccess value)? showSuccess,
    TResult Function(_ShowFailure value)? showFailure,
    TResult Function(_Hide value)? hide,
    required TResult orElse(),
  }) {
    if (showFailure != null) {
      return showFailure(this);
    }
    return orElse();
  }
}

abstract class _ShowFailure implements ShowPopUpEvent {
  factory _ShowFailure({required final String text}) = _$ShowFailureImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$ShowFailureImplCopyWith<_$ShowFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HideImplCopyWith<$Res> {
  factory _$$HideImplCopyWith(
          _$HideImpl value, $Res Function(_$HideImpl) then) =
      __$$HideImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HideImplCopyWithImpl<$Res>
    extends _$ShowPopUpEventCopyWithImpl<$Res, _$HideImpl>
    implements _$$HideImplCopyWith<$Res> {
  __$$HideImplCopyWithImpl(_$HideImpl _value, $Res Function(_$HideImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HideImpl implements _Hide {
  _$HideImpl();

  @override
  String toString() {
    return 'ShowPopUpEvent.hide()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HideImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) showWarning,
    required TResult Function(String text) showSuccess,
    required TResult Function(String text) showFailure,
    required TResult Function() hide,
  }) {
    return hide();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? showWarning,
    TResult? Function(String text)? showSuccess,
    TResult? Function(String text)? showFailure,
    TResult? Function()? hide,
  }) {
    return hide?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? showWarning,
    TResult Function(String text)? showSuccess,
    TResult Function(String text)? showFailure,
    TResult Function()? hide,
    required TResult orElse(),
  }) {
    if (hide != null) {
      return hide();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowWarning value) showWarning,
    required TResult Function(_ShowSuccess value) showSuccess,
    required TResult Function(_ShowFailure value) showFailure,
    required TResult Function(_Hide value) hide,
  }) {
    return hide(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowWarning value)? showWarning,
    TResult? Function(_ShowSuccess value)? showSuccess,
    TResult? Function(_ShowFailure value)? showFailure,
    TResult? Function(_Hide value)? hide,
  }) {
    return hide?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowWarning value)? showWarning,
    TResult Function(_ShowSuccess value)? showSuccess,
    TResult Function(_ShowFailure value)? showFailure,
    TResult Function(_Hide value)? hide,
    required TResult orElse(),
  }) {
    if (hide != null) {
      return hide(this);
    }
    return orElse();
  }
}

abstract class _Hide implements ShowPopUpEvent {
  factory _Hide() = _$HideImpl;
}

/// @nodoc
mixin _$ShowPopUpState {
  String get errorText => throw _privateConstructorUsedError;
  String get warningText => throw _privateConstructorUsedError;
  String get successText => throw _privateConstructorUsedError;
  bool get showPopUp => throw _privateConstructorUsedError;
  PopUpType get popUpType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShowPopUpStateCopyWith<ShowPopUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowPopUpStateCopyWith<$Res> {
  factory $ShowPopUpStateCopyWith(
          ShowPopUpState value, $Res Function(ShowPopUpState) then) =
      _$ShowPopUpStateCopyWithImpl<$Res, ShowPopUpState>;
  @useResult
  $Res call(
      {String errorText,
      String warningText,
      String successText,
      bool showPopUp,
      PopUpType popUpType});
}

/// @nodoc
class _$ShowPopUpStateCopyWithImpl<$Res, $Val extends ShowPopUpState>
    implements $ShowPopUpStateCopyWith<$Res> {
  _$ShowPopUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = null,
    Object? warningText = null,
    Object? successText = null,
    Object? showPopUp = null,
    Object? popUpType = null,
  }) {
    return _then(_value.copyWith(
      errorText: null == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      warningText: null == warningText
          ? _value.warningText
          : warningText // ignore: cast_nullable_to_non_nullable
              as String,
      successText: null == successText
          ? _value.successText
          : successText // ignore: cast_nullable_to_non_nullable
              as String,
      showPopUp: null == showPopUp
          ? _value.showPopUp
          : showPopUp // ignore: cast_nullable_to_non_nullable
              as bool,
      popUpType: null == popUpType
          ? _value.popUpType
          : popUpType // ignore: cast_nullable_to_non_nullable
              as PopUpType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowPopUpStateImplCopyWith<$Res>
    implements $ShowPopUpStateCopyWith<$Res> {
  factory _$$ShowPopUpStateImplCopyWith(_$ShowPopUpStateImpl value,
          $Res Function(_$ShowPopUpStateImpl) then) =
      __$$ShowPopUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String errorText,
      String warningText,
      String successText,
      bool showPopUp,
      PopUpType popUpType});
}

/// @nodoc
class __$$ShowPopUpStateImplCopyWithImpl<$Res>
    extends _$ShowPopUpStateCopyWithImpl<$Res, _$ShowPopUpStateImpl>
    implements _$$ShowPopUpStateImplCopyWith<$Res> {
  __$$ShowPopUpStateImplCopyWithImpl(
      _$ShowPopUpStateImpl _value, $Res Function(_$ShowPopUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = null,
    Object? warningText = null,
    Object? successText = null,
    Object? showPopUp = null,
    Object? popUpType = null,
  }) {
    return _then(_$ShowPopUpStateImpl(
      errorText: null == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      warningText: null == warningText
          ? _value.warningText
          : warningText // ignore: cast_nullable_to_non_nullable
              as String,
      successText: null == successText
          ? _value.successText
          : successText // ignore: cast_nullable_to_non_nullable
              as String,
      showPopUp: null == showPopUp
          ? _value.showPopUp
          : showPopUp // ignore: cast_nullable_to_non_nullable
              as bool,
      popUpType: null == popUpType
          ? _value.popUpType
          : popUpType // ignore: cast_nullable_to_non_nullable
              as PopUpType,
    ));
  }
}

/// @nodoc

class _$ShowPopUpStateImpl implements _ShowPopUpState {
  _$ShowPopUpStateImpl(
      {this.errorText = '',
      this.warningText = '',
      this.successText = '',
      this.showPopUp = false,
      this.popUpType = PopUpType.error});

  @override
  @JsonKey()
  final String errorText;
  @override
  @JsonKey()
  final String warningText;
  @override
  @JsonKey()
  final String successText;
  @override
  @JsonKey()
  final bool showPopUp;
  @override
  @JsonKey()
  final PopUpType popUpType;

  @override
  String toString() {
    return 'ShowPopUpState(errorText: $errorText, warningText: $warningText, successText: $successText, showPopUp: $showPopUp, popUpType: $popUpType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowPopUpStateImpl &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.warningText, warningText) ||
                other.warningText == warningText) &&
            (identical(other.successText, successText) ||
                other.successText == successText) &&
            (identical(other.showPopUp, showPopUp) ||
                other.showPopUp == showPopUp) &&
            (identical(other.popUpType, popUpType) ||
                other.popUpType == popUpType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, errorText, warningText, successText, showPopUp, popUpType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowPopUpStateImplCopyWith<_$ShowPopUpStateImpl> get copyWith =>
      __$$ShowPopUpStateImplCopyWithImpl<_$ShowPopUpStateImpl>(
          this, _$identity);
}

abstract class _ShowPopUpState implements ShowPopUpState {
  factory _ShowPopUpState(
      {final String errorText,
      final String warningText,
      final String successText,
      final bool showPopUp,
      final PopUpType popUpType}) = _$ShowPopUpStateImpl;

  @override
  String get errorText;
  @override
  String get warningText;
  @override
  String get successText;
  @override
  bool get showPopUp;
  @override
  PopUpType get popUpType;
  @override
  @JsonKey(ignore: true)
  _$$ShowPopUpStateImplCopyWith<_$ShowPopUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
