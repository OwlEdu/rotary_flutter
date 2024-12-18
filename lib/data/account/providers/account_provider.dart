import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/data/account/models/account_details.dart';
import 'package:rotary_flutter/data/account/services/account_service.dart';

import '../models/account.dart';

final accountServiceProvider = Provider((ref) => AccountService());

final accountsProvider = FutureProvider.family<List<Account>, int>((ref, regionId) async {
  final accountService = ref.read(accountServiceProvider);
  return accountService.getAccountsByRegion(regionId);
});

final accountDetailProvider = FutureProvider.family<AccountDetail, int>((ref, accountId) async {
  final accountService = ref.read(accountServiceProvider);
  return accountService.getAccountDetail(accountId);
});