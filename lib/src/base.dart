/// Time required until long press is started. Defaults to 250ms.
/// When the actions is shorter, regular `onPressed` callback is
/// called. When the action is longer, `onLongPressStart` callback is called.
const Duration kLongPressDuration = Duration(milliseconds: 250);
