import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

// ignore_for_file: depend_on_referenced_packages

class AvatarController extends ChangeNotifier {
  String name = '';

  changeName(String value) {
    name = value;
    notifyListeners();
  }

  String? avatarImage;
  void getAvatar(BuildContext context) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      double size = result.files.single.size / 1024;
      size = size.abs();
      if (size > 10 && size < 10240) {
        if (result.files.single.extension!.toLowerCase().endsWith('jpg') ||
            result.files.single.extension!.toLowerCase().endsWith('jpeg') ||
            result.files.single.extension!.toLowerCase().endsWith('png')) {
          avatarImage = result.files.single.path;
          notifyListeners();
        }
      }
    }
  }

  /* late String respStr;

  late dynamic data;

  String urlProduct = 'http://192.168.78.227:5000/';
  changeUrl(String value) {
    urlProduct = value;
    notifyListeners();
  }

  Future<dynamic> sendIt(imagePath) async {
    print('Log');
    var postUri = Uri.parse(urlProduct);

    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      postUri,
    );

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'file',
      imagePath,
    );

    print(multipartFile.contentType);

    request.headers.addAll({'Content-Type': '*'});

    request.files.add(multipartFile);
    print('Log');

    http.StreamedResponse response = await request.send();
    print('Log');

    print(response.statusCode);
    respStr = await response.stream.bytesToString();
    print(respStr);
    data = jsonDecode(respStr);
    return data;
  }*/
}
