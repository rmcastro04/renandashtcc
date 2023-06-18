import 'package:dartz/dartz.dart';

import '../failures/failure.dart';
import '../model/data_firebase_model.dart';

abstract class RepositoryAbstract {
  Future<Either<Failure, List<DataFirebaseModel>>> getData();
}
