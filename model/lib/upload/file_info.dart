
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mime/mime.dart';

class FileInfo with EquatableMixin {
  final String fileName;
  final String filePath;
  final int fileSize;
  final Stream<List<int>>? readStream;
  final Uint8List? bytes;

  FileInfo(this.fileName, this.filePath, this.fileSize, {this.readStream, this.bytes});

  factory FileInfo.empty() {
    return FileInfo('', '', 0);
  }

  factory FileInfo.fromStream({
    required Stream<List<int>> stream,
    String? name,
    int? size
  }) {
    return FileInfo(name ?? '', '', size ?? 0, readStream: stream);
  }

  String get fileExtension => fileName.split('.').last;

  String get mimeType => lookupMimeType(kIsWeb ? fileName : filePath) ?? 'application/octet-stream';

  @override
  List<Object?> get props => [fileName, filePath, fileSize, readStream, bytes];
}