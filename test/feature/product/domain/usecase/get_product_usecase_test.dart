import 'package:clean_architecture_riverpod/feature/product/domain/entity/product.dart';
import 'package:clean_architecture_riverpod/feature/product/domain/repository/product_repository.dart';
import 'package:clean_architecture_riverpod/feature/product/domain/usecase/get_product_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository{}

void main(){

 late GetAllProductUseCase getAllProductUseCase;
 late MockProductRepository mockProductRepository;
  final testProductEntity = [
    ProductEntity(
    title: 'test 1',
    id: 1,
    image: 'est',
    description: 'test',
    category: 'test',
    rating: Rating(count: 1,rate: 2),
    price: 23,
    ),
    ProductEntity(
      title: 'test 2',
      id: 2,
      image: 'test 2',
      description: 'test 2',
      category: 'test 2',
      rating: Rating(count: 1,rate: 2),
      price: 23,
    ),
  ];

 setUp(() {
   mockProductRepository = MockProductRepository();
   getAllProductUseCase = GetAllProductUseCase(mockProductRepository);
 });

   test('should get all product from repository', () async {
      //arrange
      when(
          mockProductRepository.getAllProducts
      ).thenAnswer((_) async => testProductEntity);
      //act
      final result = await getAllProductUseCase.execute();
      //assert
     expect(result, testProductEntity);
 });
}