// ignore_for_file: long-method, long-parameter-list
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'calendar_date_picker.dart';
import 'input_date_picker.dart';

const Size _calendarPortraitDialogSize = Size(330.0, 518.0);
const Size _calendarLandscapeDialogSize = Size(496.0, 346.0);
const Size _inputPortraitDialogSize = Size(330.0, 270.0);
const Size _inputLandscapeDialogSize = Size(496, 160.0);
const Duration _dialogSizeAnimationDuration = Duration(milliseconds: 200);
const double _inputFormPortraitHeight = 98.0;
const double _inputFormLandscapeHeight = 108.0;
const Color mainColor = Color(0xFFCC3366);
const Color mainColor2 = Color(0xFFFAEBF0);

// ignore: long-parameter-list
Future<DateTime?> showDatePickerZLP({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  SelectableDayPredicate? selectableDayPredicate,
  String? helpText,
  String? cancelText,
  String? confirmText,
  Locale? locale,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
  TextInputType? keyboardType,
  Offset? anchorPoint,
}) async {
  initialDate = DateUtils.dateOnly(initialDate);
  firstDate = DateUtils.dateOnly(firstDate);
  lastDate = DateUtils.dateOnly(lastDate);
  assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
  );
  assert(
    !initialDate.isBefore(firstDate),
    'initialDate $initialDate must be on or after firstDate $firstDate.',
  );
  assert(
    !initialDate.isAfter(lastDate),
    'initialDate $initialDate must be on or before lastDate $lastDate.',
  );
  assert(
    selectableDayPredicate == null || selectableDayPredicate(initialDate),
    'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
  );
  assert(debugCheckHasMaterialLocalizations(context));

  Widget dialog = DatePickerDialog(
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate,
    initialEntryMode: initialEntryMode,
    selectableDayPredicate: selectableDayPredicate,
    helpText: helpText,
    cancelText: cancelText,
    confirmText: confirmText,
    initialCalendarMode: initialDatePickerMode,
    errorFormatText: errorFormatText,
    errorInvalidText: errorInvalidText,
    fieldHintText: fieldHintText,
    fieldLabelText: fieldLabelText,
    keyboardType: keyboardType,
  );

  if (textDirection != null) {
    dialog = Directionality(
      textDirection: textDirection,
      child: dialog,
    );
  }

  if (locale != null) {
    dialog = Localizations.override(
      context: context,
      locale: locale,
      child: dialog,
    );
  }

  return showDialog<DateTime>(
    context: context,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    anchorPoint: anchorPoint,
  );
}

class DatePickerDialog extends StatefulWidget {
  /// A Material-style date picker dialog.
  DatePickerDialog({
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    super.key,
    DateTime? currentDate,
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.selectableDayPredicate,
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.initialCalendarMode = DatePickerMode.day,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.keyboardType,
    this.restorationId,
  })  : initialDate = DateUtils.dateOnly(initialDate),
        firstDate = DateUtils.dateOnly(firstDate),
        lastDate = DateUtils.dateOnly(lastDate),
        currentDate = DateUtils.dateOnly(currentDate ?? DateTime.now()) {
    assert(
      !this.lastDate.isBefore(this.firstDate),
      'lastDate ${this.lastDate} must be on or after firstDate ${this.firstDate}.',
    );
    assert(
      !this.initialDate.isBefore(this.firstDate),
      'initialDate ${this.initialDate} must be on or after firstDate ${this.firstDate}.',
    );
    assert(
      !this.initialDate.isAfter(this.lastDate),
      'initialDate ${this.initialDate} must be on or before lastDate ${this.lastDate}.',
    );
    assert(
      selectableDayPredicate == null ||
          selectableDayPredicate!(this.initialDate),
      'Provided initialDate ${this.initialDate} must satisfy provided selectableDayPredicate',
    );
  }

  /// The initially selected [DateTime] that the picker should display.
  final DateTime initialDate;

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime firstDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime lastDate;

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// The initial mode of date entry method for the date picker dialog.
  ///
  /// See [DatePickerEntryMode] for more details on the different data entry
  /// modes available.
  final DatePickerEntryMode initialEntryMode;

  /// Function to provide full control over which [DateTime] can be selected.
  final SelectableDayPredicate? selectableDayPredicate;

  /// The text that is displayed on the cancel button.
  final String? cancelText;

  /// The text that is displayed on the confirm button.
  final String? confirmText;

  /// The text that is displayed at the top of the header.
  ///
  /// This is used to indicate to the user what they are selecting a date for.
  final String? helpText;

  /// The initial display of the calendar picker.
  final DatePickerMode initialCalendarMode;

  /// The error text displayed if the entered date is not in the correct format.
  final String? errorFormatText;

  /// The error text displayed if the date is not valid.
  ///
  /// A date is not valid if it is earlier than [firstDate], later than
  /// [lastDate], or doesn't pass the [selectableDayPredicate].
  final String? errorInvalidText;

  /// The hint text displayed in the [TextField].
  ///
  /// If this is null, it will default to the date format string. For example,
  /// 'mm/dd/yyyy' for en_US.
  final String? fieldHintText;

  /// The label text displayed in the [TextField].
  ///
  /// If this is null, it will default to the words representing the date format
  /// string. For example, 'Month, Day, Year' for en_US.
  final String? fieldLabelText;

  /// The keyboard type of the [TextField].
  ///
  /// If this is null, it will default to [TextInputType.datetime]
  final TextInputType? keyboardType;

  /// Restoration ID to save and restore the state of the [DatePickerDialog].
  ///
  /// If it is non-null, the date picker will persist and restore the
  /// date selected on the dialog.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  @override
  State<DatePickerDialog> createState() => _DatePickerDialogState();
}

class _DatePickerDialogState extends State<DatePickerDialog>
    with RestorationMixin {
  late final RestorableDateTime _selectedDate =
      RestorableDateTime(widget.initialDate);
  late final _RestorableDatePickerEntryMode _entryMode =
      _RestorableDatePickerEntryMode(widget.initialEntryMode);
  final _RestorableAutovalidateMode _autovalidateMode =
      _RestorableAutovalidateMode(AutovalidateMode.disabled);

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(_autovalidateMode, 'autovalidateMode');
    registerForRestoration(_entryMode, 'calendar_entry_mode');
  }

  final GlobalKey _calendarPickerKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleOk() {
    if (_entryMode.value == DatePickerEntryMode.input ||
        _entryMode.value == DatePickerEntryMode.inputOnly) {
      final FormState form = _formKey.currentState!;
      if (!form.validate()) {
        setState(() => _autovalidateMode.value = AutovalidateMode.always);

        return;
      }
      form.save();
    }
    Navigator.pop(context, _selectedDate.value);
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleEntryModeToggle() {
    setState(() {
      switch (_entryMode.value) {
        case DatePickerEntryMode.calendar:
          _autovalidateMode.value = AutovalidateMode.disabled;
          _entryMode.value = DatePickerEntryMode.input;
          break;
        case DatePickerEntryMode.input:
          _formKey.currentState!.save();
          _entryMode.value = DatePickerEntryMode.calendar;
          break;
        case DatePickerEntryMode.calendarOnly:
        case DatePickerEntryMode.inputOnly:
          assert(false, 'Can not change entry mode from _entryMode');
          break;
      }
    });
  }

  void _handleDateChanged(DateTime date) {
    setState(() {
      _selectedDate.value = date;
    });
  }

  Size _dialogSize(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    switch (_entryMode.value) {
      case DatePickerEntryMode.calendar:
      case DatePickerEntryMode.calendarOnly:
        switch (orientation) {
          case Orientation.portrait:
            return _calendarPortraitDialogSize;
          case Orientation.landscape:
            return _calendarLandscapeDialogSize;
        }
      case DatePickerEntryMode.input:
      case DatePickerEntryMode.inputOnly:
        switch (orientation) {
          case Orientation.portrait:
            return _inputPortraitDialogSize;
          case Orientation.landscape:
            return _inputLandscapeDialogSize;
        }
    }
  }

  static const Map<ShortcutActivator, Intent> _formShortcutMap =
      <ShortcutActivator, Intent>{
    // Pressing enter on the field will move focus to the next field or control.
    SingleActivator(LogicalKeyboardKey.enter): NextFocusIntent(),
  };

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final Orientation orientation = MediaQuery.of(context).orientation;
    // Constrain the textScaleFactor to the largest supported value to prevent
    // layout issues.
    final double textScaleFactor =
        math.min(MediaQuery.of(context).textScaleFactor, 1.3);

    final String dateText = localizations.formatMediumDate(_selectedDate.value);

    final Widget actions = Container(
      alignment: AlignmentDirectional.center,
      constraints: const BoxConstraints(minHeight: 52.0),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: _handleOk,
            child: Container(
              width: 160,
              height: 40,
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Center(
                child: Text(
                  widget.confirmText ?? localizations.okButtonLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: _handleCancel,
            child: Text(
              widget.cancelText ?? localizations.cancelButtonLabel,
              style: const TextStyle(
                color: mainColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );

    CalendarDatePickers calendarDatePicker() {
      return CalendarDatePickers(
        key: _calendarPickerKey,
        initialDate: _selectedDate.value,
        firstDate: widget.firstDate,
        lastDate: widget.lastDate,
        currentDate: widget.currentDate,
        onDateChanged: _handleDateChanged,
        selectableDayPredicate: widget.selectableDayPredicate,
        initialCalendarMode: widget.initialCalendarMode,
      );
    }

    Form inputDatePicker() {
      return Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode.value,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: orientation == Orientation.portrait
              ? _inputFormPortraitHeight
              : _inputFormLandscapeHeight,
          child: Shortcuts(
            shortcuts: _formShortcutMap,
            child: Column(
              children: <Widget>[
                const Spacer(),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Birthday',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                InputDatePickerFormFields(
                  initialDate: _selectedDate.value,
                  firstDate: widget.firstDate,
                  lastDate: widget.lastDate,
                  onDateSubmitted: _handleDateChanged,
                  onDateSaved: _handleDateChanged,
                  selectableDayPredicate: widget.selectableDayPredicate,
                  errorFormatText: widget.errorFormatText,
                  errorInvalidText: widget.errorInvalidText,
                  fieldHintText: widget.fieldHintText,
                  fieldLabelText: widget.fieldLabelText,
                  keyboardType: widget.keyboardType,
                  autofocus: true,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      );
    }

    final Widget picker;
    final Widget? entryModeButton;
    switch (_entryMode.value) {
      case DatePickerEntryMode.calendar:
        picker = calendarDatePicker();
        entryModeButton = IconButton(
          icon: const Icon(Icons.edit_outlined),
          color: Colors.black,
          tooltip: localizations.inputDateModeButtonLabel,
          onPressed: _handleEntryModeToggle,
        );
        break;

      case DatePickerEntryMode.calendarOnly:
        picker = calendarDatePicker();
        entryModeButton = null;
        break;

      case DatePickerEntryMode.input:
        picker = inputDatePicker();
        entryModeButton = IconButton(
          icon: const Icon(Icons.calendar_today),
          color: Colors.black,
          tooltip: localizations.calendarModeButtonLabel,
          onPressed: _handleEntryModeToggle,
        );
        break;

      case DatePickerEntryMode.inputOnly:
        picker = inputDatePicker();
        entryModeButton = null;
        break;
    }

    final Widget header = _DatePickerHeader(
      helpText: widget.helpText ?? 'Birthday',
      titleText: dateText,
      orientation: orientation,
      isShort: orientation == Orientation.landscape,
      entryModeButton: entryModeButton,
    );

    final Size dialogSize = _dialogSize(context) * textScaleFactor;

    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        width: dialogSize.width,
        height: dialogSize.height,
        duration: _dialogSizeAnimationDuration,
        curve: Curves.easeIn,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: Builder(
            builder: (BuildContext context) {
              switch (orientation) {
                case Orientation.portrait:
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      header,
                      Expanded(child: picker),
                      actions,
                    ],
                  );
                case Orientation.landscape:
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      header,
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(child: picker),
                            actions,
                          ],
                        ),
                      ),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

// A restorable [DatePickerEntryMode] value.
//
// This serializes each entry as a unique `int` value.
class _RestorableDatePickerEntryMode
    extends RestorableValue<DatePickerEntryMode> {
  _RestorableDatePickerEntryMode(
    DatePickerEntryMode defaultValue,
  ) : _defaultValue = defaultValue;

  final DatePickerEntryMode _defaultValue;

  @override
  DatePickerEntryMode createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(DatePickerEntryMode? oldValue) {
    assert(debugIsSerializableForRestoration(value.index));
    notifyListeners();
  }

  @override
  DatePickerEntryMode fromPrimitives(Object? data) =>
      DatePickerEntryMode.values[data! as int];

  @override
  Object? toPrimitives() => value.index;
}

// A restorable [AutovalidateMode] value.
//
// This serializes each entry as a unique `int` value.
class _RestorableAutovalidateMode extends RestorableValue<AutovalidateMode> {
  _RestorableAutovalidateMode(
    AutovalidateMode defaultValue,
  ) : _defaultValue = defaultValue;

  final AutovalidateMode _defaultValue;

  @override
  AutovalidateMode createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(AutovalidateMode? oldValue) {
    assert(debugIsSerializableForRestoration(value.index));
    notifyListeners();
  }

  @override
  AutovalidateMode fromPrimitives(Object? data) =>
      AutovalidateMode.values[data! as int];

  @override
  Object? toPrimitives() => value.index;
}

/// Re-usable widget that displays the selected date (in large font) and the
/// help text above it.
///
/// These types include:
///
/// * Single Date picker with calendar mode.
/// * Single Date picker with text input mode.
/// * Date Range picker with text input mode.
///
/// [helpText], [orientation], [icon], [onIconPressed] are required and must be
/// non-null.
class _DatePickerHeader extends StatelessWidget {
  /// Creates a header for use in a date picker dialog.
  const _DatePickerHeader({
    required this.helpText,
    required this.titleText,
    required this.orientation,
    this.isShort = false,
    this.entryModeButton,
  });

  static const double _datePickerHeaderLandscapeWidth = 152.0;
  static const double _datePickerHeaderPortraitHeight = 86.0;
  static const double _headerPaddingLandscape = 16.0;

  /// The text that is displayed at the top of the header.
  ///
  /// This is used to indicate to the user what they are selecting a date for.
  final String helpText;

  /// The text that is displayed at the center of the header.
  final String titleText;

  /// The orientation is used to decide how to layout its children.
  final Orientation orientation;

  /// Indicates the header is being displayed in a shorter/narrower context.
  ///
  /// This will be used to tighten up the space between the help text and date
  /// text if `true`. Additionally, it will use a smaller typography style if
  /// `true`.
  ///
  /// This is necessary for displaying the manual input mode in
  /// landscape orientation, in order to account for the keyboard height.
  final bool isShort;

  final Widget? entryModeButton;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    const Color primarySurfaceColor = mainColor2;

    final TextStyle? helpStyle = textTheme.overline?.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

    final Text help = Text(
      helpText,
      style: helpStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    final Text title = Text(
      titleText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
      maxLines: orientation == Orientation.portrait ? 1 : 2,
      overflow: TextOverflow.ellipsis,
    );

    switch (orientation) {
      case Orientation.portrait:
        return SizedBox(
          height: _datePickerHeaderPortraitHeight,
          child: Material(
            color: primarySurfaceColor,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
                end: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 16),
                  help,
                  Row(
                    children: <Widget>[
                      Expanded(child: title),
                      if (entryModeButton != null) entryModeButton!,
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      case Orientation.landscape:
        return SizedBox(
          width: _datePickerHeaderLandscapeWidth,
          child: Material(
            color: primarySurfaceColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: _headerPaddingLandscape,
                  ),
                  child: help,
                ),
                SizedBox(height: isShort ? 16 : 56),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: _headerPaddingLandscape,
                    ),
                    child: title,
                  ),
                ),
                if (entryModeButton != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: entryModeButton,
                  ),
              ],
            ),
          ),
        );
    }
  }
}
