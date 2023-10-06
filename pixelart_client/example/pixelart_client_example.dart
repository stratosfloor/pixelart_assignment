import 'dart:io';
import 'dart:math';
import 'package:pixelart_client/pixelart_client.dart';
import 'package:pixelart_shared/pixelart_shared.dart';
import 'package:uuid/uuid.dart';

void main() async {
  // Initialize a UUID generator
  Uuid uuid = Uuid();

  // Create a new PixelArt object
  PixelArt art = PixelArt(
    id: 'emil',
    name: 'emil',
    description: uuid.v4(),
    width: 64,
    height: 64,
    editors: [],
    pixelMatrix: [[]],
  );

  // Initialize the repository
  final repository = HTTPPixelArtRepository(url: "localhost:8080/pixelart");
  var connected = false;
  for (int i = 0; i < 10; i++) {
    var response = await repository.list();
    if (response.isFailure && response.status == CRUDStatus.NetworkError) {
      print(
          "NetworkError connecting to server. Is the server up and running? Start with 'dart_frog dev'");
      await Future.delayed(Duration(seconds: 2));
    } else {
      connected = true;
      break;
    }
  }

  if (!connected) {
    print(
        "Unable to connect to server. Is the server up and running? Start with 'dart_frog dev'");
    print("Exiting. Try again.");
    exit(255);
  } else {
    print('Connected to server.');
  }

  // Create pixelArt
  final newPixelArt = await repository.create(art);
  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print('CREATE NEW PIXELART:');
  print('');
  print(newPixelArt.value);
  print('');

  // Read pixelArt
  final pixelArtFromRepo = await repository.read('emil');
  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print('READ PIXELART:');
  print('');
  print(pixelArtFromRepo.value);
  print('');

  // Update pixelart
  final updated = pixelArtFromRepo.value?.copyWith(name: noren.name);
  repository.update(art.id, updated!);
  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print('UPDATE PIXELART:');
  print('');
  print(updated);
  print('');

  // list pixelart
  final list = await repository.list();
  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print('LIST PIXELART:');
  print('');
  print(list.value?.length);
  // print(list.value);
  print('');

  // Delete pixelArt
  final deleted = await repository.delete(art.id);
  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print('DELETE PIXELART:');
  print('');
  print('Delete was a ${deleted.status}');
  print('');

  // Exit the application
  print('Exiting application.');
  exit(0);
}

int getRandomInt() {
  return Random().nextInt(255);
}

// Randomly generated pixel
Pixel randomPixel(Participant participant) {
  return Pixel(
    red: getRandomInt(),
    green: getRandomInt(),
    blue: getRandomInt(),
    alpha: getRandomInt(),
    placedBy: getRandomInt() % 2 == 0 ? emil : noren,
  );
}

// Set up participants
final emil = Participant(id: '01', name: 'Emil');
final noren = Participant(id: '02', name: 'Noren');
