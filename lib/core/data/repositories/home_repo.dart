import '../../constants/failure.dart';
import '../databases/local_data_source.dart';
import '../either.dart';
import '../get_it.dart';
import '../model/event_model.dart';

abstract class HomeRepository {
  Future<Either<StorageFailure, int>> addNewEvent(EventModel model);
  Future<Either<StorageFailure, List<EventModel>>> getEvents(String time);
  Future<Either<StorageFailure, List<int>>> getFirst3EventsColorIndexes(
    String date
  );
  
  Future<Either<StorageFailure, void>> deleteAnEvent(int id);
  Future<Either<StorageFailure, void>> updateAnEvent(EventModel model); 
}

class HomeRepositoryImpl implements HomeRepository {
  
  @override
  Future<Either<StorageFailure, int>> addNewEvent(EventModel model) async {
    try {
      var id = await getIt<LocalDataSource>().addModel(model);
      return Right(id);
    } catch (e) {
      return Left(StorageFailure(errorMessage: 'Unable to add'));
    }
  }
  
  @override
  Future<Either<StorageFailure, List<EventModel>>> getEvents(
    String time) async {
      try {
        final data = await getIt<LocalDataSource>().getModels(time);
        return Right(data);
      } catch (e) {
        return Left(StorageFailure(errorMessage: 'Unable to get data'));
      }
    }
    
    @override
    Future<Either<StorageFailure, List<int>>> getFirst3EventsColorIndexes(
      String date) async {
        try {
          final result = 
                await getIt<LocalDataSource>().getFirst3EventsColorIndexes(date);
          return Right(result);
        } catch (e) {
          return Left(StorageFailure(errorMessage: 'Something went wrong'));
        }
      }
      
    @override
    Future<Either<StorageFailure, void>> deleteAnEvent(int id) async {
      try {
        await getIt<LocalDataSource>().deleteAnEvent(id);
        return Right(null);
      } catch (e) {
        return Left(StorageFailure(errorMessage: 'Something went wrong'));        
      }
    }  
    
    @override
    Future<Either<StorageFailure, void>> updateAnEvent(EventModel model) async {
      try {
        await getIt<LocalDataSource>().updateAnEvent(model);
        return Right(null);
      } catch (e) {
        return Left(StorageFailure(errorMessage: 'Something went wrong'));
      }
    }
}