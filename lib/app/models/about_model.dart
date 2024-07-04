class AboutDummyModel {
  AboutDummyModel({
    this.id,
    this.title,
    this.image,
  });

  final int? id;
  final String? title;
  final String? image;
}

List<AboutDummyModel> aboutDummyModel = [
  AboutDummyModel(
    id: 1,
    title: '',
    image: 'pens',
  ),
  AboutDummyModel(
    id: 2,
    title: 'Aquaculture PENS',
    image: 'aqlab',
  ),
  AboutDummyModel(
    id: 3,
    title: '',
    image: 'lpdp',
  ),
  AboutDummyModel(
    id: 4,
    title: '',
    image: 'mitras',
  ),
  AboutDummyModel(
    id: 5,
    title: '',
    image: 'kemen',
  ),
];
