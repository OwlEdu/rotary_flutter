abstract class LoadState{}

class Loading extends LoadState {

}

class Success extends LoadState {
  final dynamic data;
  Success(this.data);
}

class Error extends LoadState {
  final Object exception;
  Error(this.exception);
}