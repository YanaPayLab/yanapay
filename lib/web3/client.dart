import 'dart:io';
import 'package:http/http.dart';
import 'package:path/path.dart' show join, dirname;
import 'package:web3dart/web3dart.dart';

const String privateKey =
    '0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80';
final EthereumAddress contractAddr =
    EthereumAddress.fromHex('0x5fbdb2315678afecb367f032d93f642f64180aa3');
const String rpcUrl = 'http://localhost:8545';
const String wsUrl = 'ws://localhost:8545';
final File abiFile =
    File(join(dirname(Platform.script.path), 'lib/web3/contract.abi.json'));

Future<void> obtenerCinco() async {
  final client = Web3Client(rpcUrl, Client());
  final credentials = EthPrivateKey.fromHex(privateKey);
  final address = credentials.address;
  print(await client.getBalance(address));
  final abiCode = await abiFile.readAsString();
  final contract =
      DeployedContract(ContractAbi.fromJson(abiCode, 'Cinco'), contractAddr);
  final obtenerCinco = contract.function('obtenerCinco');
  final cinco =
      await client.call(contract: contract, function: obtenerCinco, params: []);
  await client.dispose();
  print('Cinco: ${cinco[0]}');
}
