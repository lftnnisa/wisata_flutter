import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_flutter/provider/done_tourism_provider.dart';
import 'detail_screen.dart';
import 'list_item.dart';
import 'model/tourism_place.dart';

class TourismList extends StatefulWidget{
  const TourismList({Key? key}) : super(key: key);

  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList>{
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl Pemuda',
      imageAsset: 'assets/images/submarine.jpg',
      desc: 'Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and well maintaned.'
          'Car park cost 10k, entrance fee 15k/person. You can see KRI Pasopati there, it is a russian whiskey class. You can also watch the video about the Indonesian Navy at the buiding beside the submarine.',
      date: 'Open Everyday',
      time: '08:00 - 16:00',
      price: 'Rp 10.000,-',
      photos: [
        'assets/images/monkasel_1.jpg',
        'assets/images/monkasel_2.jpg',
        'assets/images/monkasel_3.jpg',
      ],
    ),
    TourismPlace(
      name: 'Klenteng Sanggar Agung',
      location: 'Kenjeran',
      imageAsset: 'assets/images/klenteng.jpg',
      desc: 'Sanggar Agung Temple or Hong San Tang is a Chinese temple in Surabaya dedicated to Chinese deities and other Asian religious icons.'
          'It is located within the Pantai Ria amusement park and has become a tourist destination, even though it is originally a worship place for Tridharma followers.',
      date: 'Open Everyday',
      time: '08:00 - 16:00',
      price: 'Rp 10.000,-',
      photos: [
        'assets/images/monkasel_1.jpg',
        'assets/images/monkasel_2.jpg',
        'assets/images/monkasel_3.jpg',
      ],
    ),
    TourismPlace(
      name: 'House of Sampoerna',
      location: 'Krembangan Utara',
      imageAsset: 'assets/images/sampoerna.jpg',
      desc: 'The House of Sampoerna is a tobacco museum and headquarters of Sampoerna located in Surabaya.'
          'The main buildings architectural style influenced by Dutch colonial-style compound was built in 1862, and is now a preserved historical site.',
      date: 'Open Everyday',
      time: '08:00 - 16:00',
      price: 'Rp 10.000,-',
      photos: [
        'assets/images/monkasel_1.jpg',
        'assets/images/monkasel_2.jpg',
        'assets/images/monkasel_3.jpg',
      ],
    ),
    TourismPlace(
      name: 'Tugu Pahlawan',
      location: 'Alun-alun contong',
      imageAsset: 'assets/images/pahlawan.jpg',
      desc: 'The Heroes Monument is a monument in Surabaya, East Java, Indonesia. It is the main symbol of the city, '
          'dedicated to the people who died during the Battle of Surabaya on 10 November 1945. The 10 November Museum is located under the monument',
      date: 'Open Everyday',
      time: '08:00 - 16:00',
      price: 'Rp 10.000,-',
      photos: [
        'assets/images/monkasel_1.jpg',
        'assets/images/monkasel_2.jpg',
        'assets/images/monkasel_3.jpg',
      ],
    ),
    TourismPlace(
      name: 'Patung Suro Boyo',
      location: 'Wonokromo',
      imageAsset: 'assets/images/sby.jpg',
      desc: 'Patung Sura dan Baya (Jawa: Patung Suro lan Boyo) adalah sebuah patung yang merupakan lambang kota Surabaya. Patung ini berada di depan Kebun Binatang Surabaya. '
          'Patung ini terdiri atas dua hewan yaitu buaya dan hiu yang menjadi inspirasi nama kota Surabaya: ikan sura (hiu) dan baya (buaya)',
      date: 'Open Everyday',
      time: '08:00 - 16:00',
      price: 'Rp 10.000,-',
      photos: [
        'assets/images/monkasel_1.jpg',
        'assets/images/monkasel_2.jpg',
        'assets/images/monkasel_3.jpg',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen(place: place);
            }));
          },
          child: Consumer<DoneTourismProvider> (
            builder : (context, DoneTourismProvider data, widget){
              return ListItem(
                place: place,
                isDone: data.doneTourismPlaceList.contains(place),
                onCheckboxClick: (bool? value){
                  setState(() {
                    if(value!=null){
                    value
                        ? data.doneTourismPlaceList.add(place)
                        : data.doneTourismPlaceList.remove(place);
                    }
                  });
                },
              );
            },
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}