abstract class MessageState {}

class InitialState extends MessageState {}

class UpdMessageState extends MessageState {
  final String message;

  UpdMessageState(this.message);
}
