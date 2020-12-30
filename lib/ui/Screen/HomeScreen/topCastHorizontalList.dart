import 'package:flutter/material.dart';


import 'package:youtube_app/ui/CommomWidgets/circulerImageView.dart';

class TopCastHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(top: 0.0, right: 0, left: 0, bottom: 5),
      child: Container(
        color:Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, right: 5, left: 5, bottom: 0),
          child: ListView.builder(
              itemCount: 30,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return topCastWidget(context);
              }),
        ),
      ),
    );
  }

  Widget topCastWidget(BuildContext context) {
    return Column(
       
      children: [
           SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: CirculerImageView(
            height: 70,
            width: 70,
            imageUrl:
                "https://media.phillyvoice.com/media/images/Wire_Cutters.2e16d0ba.fill-735x490.png",
          ),
        ),

        SizedBox(height: 5,),
        Text("Wire cutter",style: Theme.of(context).textTheme.bodyText1,)
      ],
    );
  }
}
