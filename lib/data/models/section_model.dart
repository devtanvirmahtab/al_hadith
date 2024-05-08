class SectionModel {
  int? id;
  int? bookId;
  String? bookName;
  int? sectionId;
  int? chapterId;
  String? title;
  String? number;
  String? preface;

  SectionModel({
    this.id,
    this.title,
    this.chapterId,
    this.bookId,
    this.number,
    this.bookName,
    this.preface,
    this.sectionId,
  });

  factory SectionModel.fromMap(Map<dynamic, dynamic> section) => SectionModel(
    id: section['id'],
    chapterId:section['chapter_id'] ,
    bookId: section['book_id'],
    title: section['title'],
    number: section['number'],
    preface: section['preface'],
    bookName: section['book_name'],
    sectionId: section['section_id'],
  );
}
