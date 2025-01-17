import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/presentation/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/presentation/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }
}
