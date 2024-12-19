abstract class State{}

class Loading extends State {

}

class Success extends State {
  final dynamic data;
  Success(this.data);
}

class Error extends State {
  final Object exception;
  Error(this.exception);
}