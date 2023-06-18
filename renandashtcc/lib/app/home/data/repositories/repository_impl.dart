// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_dashboard/failures/failure.dart';
// import 'package:flutter_dashboard/model/teste._model.dart';
// import 'package:flutter_dashboard/repositories/repository_abstract.dart';

// class RepositoryImpl implements RepositoryAbstract {
//   @override
//   Future<Either<Failure, List<DoubleIdModel>>> getData() async {
//     try {
//       final CollectionReference collectionVisitorsTable =
//           FirebaseFirestore.instance.collection('dash_brasil');
//       DocumentReference docRef = collectionVisitorsTable.doc("idhm");

//       final response = await docRef.get();

//       List<DoubleIdModel> list = [];

//       final lista = response['data'] as List<dynamic>;

//       for (var item in lista) {
//         if (item is Map<String, dynamic>) {
//           DoubleIdModel visitor = DoubleIdModel.fromJson(item);
//           list.add(visitor);
//         }
//       }
//       return Right(list);
//     } catch (error) {
//       return Left(Failure());
//     }
//   }
// }
