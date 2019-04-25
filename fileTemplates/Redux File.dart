import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';

#set ( $partName = $FILE_NAME.replace(".dart", ".g.dart") )
part '${partName}';

// State

abstract class ${State_name}State implements Built<${State_name}State, ${State_name}StateBuilder> {
  int get count;

  ${State_name}State._();

  factory ${State_name}State([updates(${State_name}StateBuilder b)]) = _${DS}${State_name}State;

  static ${State_name}StateBuilder initial() => ${State_name}StateBuilder()..count = 0;
}

// Actions

class SetCount {
  final int count;

  SetCount(this.count);
}

// Reducers

#set ( $stateLowerCamelCase = $State_name.substring(0,1).toLowerCase()+$State_name.substring(1) )
final ${stateLowerCamelCase}StateReducer = combineReducers<${State_name}State>([
  TypedReducer(_onSetCount),
]);

${State_name}State _onSetCount(${State_name}State state, SetCount action) => state.rebuild((b) => b..count = action.count);