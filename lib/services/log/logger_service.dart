abstract class LoggerService {
  Future verbose(String message);
  Future err(String message);
  Future info(String message);
  Future exception(Exception exception);
  Future exceptionTrace(Object exception, Object stackTrace);
}
