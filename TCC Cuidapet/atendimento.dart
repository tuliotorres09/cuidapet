import 'dart:io';

void main() {
  String endereco = "Rua Andorinhas, número 443, Centro, São Paulo - SP";
  String numloja = "35 4002-8922";

  int opcao;
  int totalClientes = 0;

  while (true) {
    // Novo cliente
    print("Digite o seu nome: ");
    String nomeCliente = stdin.readLineSync()!;
    totalClientes++;

    print("\nPrezado(a), $nomeCliente. Seja muito bem-vindo(a) à nossa loja.\n");
    print("Endereço: $endereco");
    print("Telefone: $numloja\n");

    while (true) {
      print("------------ MENU ------------");
      print("""
1 - Ver ofertas de Produtos
2 - Ver ofertas de Serviços
3 - Ver ofertas de roupas
4 - Ver novos serviços
5 - Promoção I (10%)
6 - Promoção II (20%)
7 - Sair
""");

      print("Digite uma opção: ");
      opcao = int.tryParse(stdin.readLineSync()!) ?? 0;

      if (opcao == 7) {
        print("\nSistema encerrado.");
        print("Total de clientes atendidos hoje: $totalClientes");
        return; // encerra o programa
      }

      switch (opcao) {
        case 1:
          print("Ração Royal Canin Indor 7,5kg - R\$ 280,00");
          break;

        case 2:
          print("Banho e tosa - R\$ 54,00");
          break;

        case 3:
          print("Capa de chuva - R\$ 59,99");
          break;

        case 4:
          print("Hidratação: R\$ 39,99 | Tosa higiênica: R\$ 10,99 | Tingimento: R\$ 55,99");
          break;

        case 5:
          print("Compre ração 15kg (R\$ 345,99) e ganhe 10% no banho");
          break;

        case 6:
          print("Banho + tosa + hidratação com 20% de desconto");
          break;

        default:
          print("Opção inválida.");
      }

      print("\nDeseja continuar com este cliente? (s/n)");
      String continuar = stdin.readLineSync()!.toLowerCase();

      if (continuar != 's') {
        break; // vai para o próximo cliente
      }
    }
  }
}