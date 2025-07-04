
import 'package:cos_assignment/data/apis/cos_api/snippet.dart';
import 'package:http/http.dart';
import 'package:riverpod/riverpod.dart';

/// The `apiProvider` is a provider that provides access to the API client.
final apiProvider = Provider<BaseClient>((ref) => CosChallenge.httpClient);