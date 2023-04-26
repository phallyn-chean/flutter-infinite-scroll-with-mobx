import 'package:flutter/material.dart';
import 'package:infinite_scroll/models/card_model.dart';

class CardItemView extends StatefulWidget {
  const CardItemView({super.key, required this.models});

  final CardModels models;

  @override
  State<CardItemView> createState() => _CardItemViewState();
}

class _CardItemViewState extends State<CardItemView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      child: Column(
        children: [_buildImageItem, _buildDescriptionItem],
      ),
    );
  }

  ListTile get _buildDescriptionItem {
    return ListTile(
      title: Text(widget.models.author),
      subtitle:
          Text("H = ${widget.models.height} / W = ${widget.models.width}"),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.file_download),
      ),
    );
  }

  SizedBox get _buildImageItem {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Image.network(
          widget.models.downloadUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
