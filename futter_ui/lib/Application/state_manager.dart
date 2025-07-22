import 'package:kilai/Base/state.dart';

class StateManager {
  static final StateManager _instance = StateManager();

  final List<State> _states = [];
  final Map<Type, State> _stateMap = {};

  static get getInstance {
    return _instance;
  }

  void LoadState<T>() {
    var state = GetStateFromMap<T>();
    _states.last.OnStatePause();

    _states.add(state);
    _states.last.OnStateEnter();
  }

  void PopState() {
    if (_states.isEmpty) {
      // error log
      return;
    }

    _states.last.OnStateExit();
    _states.removeLast();

    if (_states.isEmpty) {
      // error log
      return;
    }

    _states.last.OnStateResume();
  }

  void SwapState<T>() {
    PopState();
    LoadState<T>();
  }

  T GetState<T>() {
    return _states.last as T;
  }

  State GetStateFromMap<T>() {
    if (_stateMap.containsKey(T)) {
      return _stateMap[T]!;
    }

    State state = T as State;
    _stateMap[T] = state;

    return state;
  }
}
