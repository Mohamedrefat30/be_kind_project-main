import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<XFile?> pickFromCamera();
  Future<XFile?> pickFromGallery();
}

class ImagePickerServiceImpl implements ImagePickerService {
  ImagePickerServiceImpl(this._imagePicker);

  final ImagePicker _imagePicker;

  @override
  Future<XFile?> pickFromCamera() {
    return _imagePicker.pickImage(source: ImageSource.camera);
  }

  @override
  Future<XFile?> pickFromGallery() {
    return _imagePicker.pickImage(source: ImageSource.gallery);
  }
}
