class MuseumModel {
  String? photoList;
  String? name;
  String? description;
  int? entryPriceAdult;
  int? entryPriceChildElderly;
  int? taxPercentage;

  //named constructor
  MuseumModel(
      {this.photoList,
      this.name,
      this.description,
      this.entryPriceAdult,
      this.entryPriceChildElderly,
      this.taxPercentage});

  static final museumList = [
    MuseumModel(
        photoList: 'https://museum.bnm.gov.my/v2/images/ArtG/Slide-1.jpg',
        name: "Art & Gallery Mont Kiara",
        description:
            'The Art Gallery provides a rotating display of the Central Bank of Malaysia’s art collection. There are paintings, prints, drawings and sculptures which chart the progress of the nation and highlight the Central Bank’s support for the arts, which include works by early masters such as Mohd Hoessein Enas, Yong Mun Sen, Chuah Thean Teng, Syed Ahmad Jamal, Ibrahim Hussein up to the present day of young artist.',
        entryPriceAdult: 99,
        entryPriceChildElderly: 49,
        taxPercentage: 6),
    MuseumModel(
        photoList:
            'https://museum.bnm.gov.my/v2/images/numismaticsG/Slide-3.jpg',
        name: "Numismatics Gallery Puchong",
        description:
            'Discover the early history of money and go back to a time when objects of different shapes and sizes were commonly accepted as currency within the region. Play the ‘Barter Trade’ game, explore the unique ‘River of Coins and see the display of world banknotes.',
        entryPriceAdult: 39,
        entryPriceChildElderly: 19,
        taxPercentage: 6),
    MuseumModel(
        photoList: 'https://museum.bnm.gov.my/v2/images/childrenG/Slide-2.jpg',
        name: "Children's Gallery KLCC",
        description:
            'Filled with hands-on games and activities based on the concept of ‘Save, Spend and Share’, the Children’s Gallery is a unique informal learning venue. Experience the RM1 Million Tunnel with its variety of Malaysian banknote denominations and series.',
        entryPriceAdult: 0,
        entryPriceChildElderly: 9,
        taxPercentage: 6),
  ];
}
