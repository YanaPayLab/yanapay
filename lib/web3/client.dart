import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:yanapay/web3/contract.dart' as abi;

final EthereumAddress contractAddr =
    EthereumAddress.fromHex('0xd020Af9e3a12AB61b837ae4E54365435925479b1');
const String rpcUrl = 'https://rpc2.sepolia.org';


//  Future<void> crearCuenta() async {
//   final client = Web3Client(rpcUrl, Client());
//   //917975944
//   //0x1133e1a460462e44eeaee7a3c14292f3c112877f
//   var rng = Random.secure();
//   print('Random: ${rng.hashCode}');
//   Credentials random = EthPrivateKey.createRandom(rng);
//   print('Random: ${random.address}');
//   // Credentials random = EthPrivateKey.fromInt(BigInt.from(917975944));
//   var address = random.address;
//   print('Address: ${address}');
//   print(await client.getBalance(address));
// }

Future<void> obtenerBalace(String privateKey) async {
  print('======== Obtener balance =========');
  final client = Web3Client(rpcUrl, Client());
  final credentials = EthPrivateKey.fromHex(privateKey);
  final address = credentials.address;
  print(await client.getBalance(address));
  print(await client.getBalance(address));
  String abiCode = jsonEncode(abi.abi);
  final contract =
      DeployedContract(ContractAbi.fromJson(abiCode, 'YanaPay'), contractAddr);
  final balanceOf = contract.function('balanceOf');
  final balance =
      await client.call(contract: contract, function: balanceOf, params: [address]);
  await client.dispose();
  print('Balance: ${balance}');
}

Future<void> sendYanaPay(String keyBuyer, int pay) async {
  const String privateKeyYanaPay =
    '';
  print('======= Enviar a la billetera Yanapay =========');
  final client = Web3Client(rpcUrl, Client());
  final credentialsYanaPay = EthPrivateKey.fromHex(privateKeyYanaPay);
  final addressYanaPay = credentialsYanaPay.address;
  EthereumAddress addressBuyer = EthPrivateKey.fromHex(keyBuyer).address;
  String abiCode = jsonEncode(abi.abi);
  final contract = DeployedContract(
    ContractAbi.fromJson(abiCode, 'YanaPay'),
    contractAddr
  );
  final transferFrom = contract.function('transferFrom');
  final approve = contract.function('approve');
  print('>>> ${addressBuyer}');
  await client.call(
    contract: contract,
    function: approve,
    params: [addressBuyer, BigInt.from(pay)]
  );
  print('>>>>>>>>>>>>>> Enviar tokens');
  await client.call(
    contract: contract,
    function: transferFrom,
    params: [addressBuyer, addressYanaPay, BigInt.from(pay)]
  );
  await client.dispose();
}

Future<void> sendSeller(String keySeller, int pay) async {
  print('======== Enviar a la billetera del vendedor =========');
  const String privateKeyYanaPay =
    '';
  final client = Web3Client(rpcUrl, Client());
  final credentialsSeller = EthPrivateKey.fromHex(keySeller);
  final credentialsYanaPay = EthPrivateKey.fromHex(privateKeyYanaPay);
  final addressYanaPay = credentialsYanaPay.address;
  final addressSeller = credentialsSeller.address;
  String abiCode = jsonEncode(abi.abi);
  final contract = DeployedContract(
    ContractAbi.fromJson(abiCode, 'YanaPay'),
    contractAddr
  );
  final approve = contract.function('approve');
  await client.call(
    contract: contract,
    function: approve,
    params: [addressYanaPay, BigInt.from(pay)]
  );
  final transfer= contract.function('transfer');
  await client.call(
    contract: contract,
    function: transfer,
    params: [addressSeller, BigInt.from(pay)]
  );
  await client.dispose();
}
