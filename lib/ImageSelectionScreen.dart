import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectionScreen extends StatefulWidget {
  const ImageSelectionScreen({Key? key}) : super(key: key);

  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  File? _imageFile;
  String _status = "";
  bool _imgLoading = false;
  ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _status = '';
    _imgLoading = false;
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    print("Image file is null");
    print(_imageFile == null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _imageFile == null
              ? Container()
              : Image.file(
                  _imageFile!,
                  filterQuality: FilterQuality.high,
                ),
          SizedBox(height: 20),
          Text(_status),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  _select() {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      color: Colors.black12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _button('Camera', ImageSource.camera),
          _button('Gallery', ImageSource.gallery),
        ],
      ),
    );
  }

  _button(String text, ImageSource imageSource) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          _imgLoading = true;
          _imageFile = null;
        });
      },
      child: Text(text),
    );
  }

  Future<PickedFile> _loadImage(ImageSource imageSource) async {
    PickedFile? file = await _imagePicker.getImage(source: imageSource);
    if (file == null) {}
    return null;
  }
}
