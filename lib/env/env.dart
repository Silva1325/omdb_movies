// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'OMDB_API_KEY',obfuscate: true)
  static final String omdbApiKey = _Env.omdbApiKey;
}