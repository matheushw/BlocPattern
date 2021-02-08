import 'package:BlocProj/events.dart';
import 'package:BlocProj/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTest extends Bloc<MessageEvent, MessageState> {
  String _message = "";

  BlocTest({InitialState initialState}) : super(InitialState());

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async*{
    if (event.message != null) {
      _message = event.message;
    }

    yield UpdMessageState(_message);
  }
}
