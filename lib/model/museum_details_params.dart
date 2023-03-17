class MuseumDetailsParams {
  //positional constructor
  MuseumDetailsParams(this.name, this.photoUrl, this.desc, this.priceAdult,
      this.priceChildElderly, this.tax);

  final String name;
  final String photoUrl;
  final String desc;
  final int priceAdult;
  final int priceChildElderly;
  final int tax;
}
