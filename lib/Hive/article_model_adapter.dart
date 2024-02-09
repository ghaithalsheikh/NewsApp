import 'package:hive/hive.dart';
import 'package:news_app/models/articles_model.dart';

class ArticleModelAdapter extends TypeAdapter<ArticleModel> {
  @override
  final int typeId = 0;

  @override
  ArticleModel read(BinaryReader reader) {
    final fieldsCount = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < fieldsCount; i++) {
      final fieldKey = reader.readByte();
      final fieldValue = reader.read();
      fields[fieldKey] = fieldValue;
    }
    return ArticleModel(
      image: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      urlImage: fields[3] as String,
      publishedAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleModel obj) {
    writer.writeByte(5); // Number of fields in the ArticleModel class
    writer.writeByte(0);
    writer.write(obj.image);
    writer.writeByte(1);
    writer.write(obj.title);
    writer.writeByte(2);
    writer.write(obj.description);
    writer.writeByte(3);
    writer.write(obj.urlImage);
    writer.writeByte(4);
    writer.write(obj.publishedAt);
  }
}
