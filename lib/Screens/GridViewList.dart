// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GridVieWLiST extends StatefulWidget {
  const GridVieWLiST({super.key});

  @override
  State<GridVieWLiST> createState() => _GridVieWLiSTState();
}

class _GridVieWLiSTState extends State<GridVieWLiST> {
  var storeImages = [
   "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
    "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
  "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
   "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
  "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",


];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar "),
      ),
      body: Column(
        children: [
          Text("GRID VIEW LIST "),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
            itemCount: storeImages.length, 
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing:10 ,
              crossAxisSpacing: 10
              ),
              itemBuilder: (context,index){
                return Container(
                  
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: Colors.red,style: BorderStyle.solid),
                    image: DecorationImage(image: NetworkImage(storeImages[index]),
                   
                    )
                  ),
                );
              }),
            
          ),
        ],
      ),
      
    );
  }
}