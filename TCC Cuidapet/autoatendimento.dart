import 'dart:io';

int totalVendas = 0;
double valorTotalVendas = 0;

void main() {
  while (true) {
    print("=== Bem vindo ao autoatendimento do Cuidapet ===");
    print("Digite o seu nome:");
    String nome = stdin.readLineSync()!;

    
    if (nome == "cuidapetrestrito") {
      areaRestrita();
      continue;
    }

    
    List<String> carrinho = [];
    List<double> precos = [];

    menuPrincipal(carrinho, precos);
  }
}

void menuPrincipal(List<String> carrinho, List<double> precos) {
  while (true) {
    print("""
    
1 - Ver promoções
2 - Solicitar serviço
3 - Listar carrinho de compra
4 - Finalizar carrinho de compra
0 - Sair

Digite sua opção desejada:
""");

    int opcao = int.tryParse(stdin.readLineSync()!) ?? -1;

    switch (opcao) {
      case 1:
        menuPromocoes(carrinho, precos);
        break;

      case 2:
        menuServicos(carrinho, precos);
        break;

      case 3:
        listarCarrinho(carrinho, precos);
        break;

      case 4:
        finalizarCompra(carrinho, precos);
        break;

      case 0:
        encerrarSistema();
        break;

      default:
        print("Opção inválida.");
    }
  }
}

void menuPromocoes(List<String> carrinho, List<double> precos) {
  while (true) {
    print("""
    
101 - Ração Royal Canin Indoor 7,5kg - R\$ 290,00
102 - Ração Royal Canin Sterilised - R\$ 492,00
103 - Bifinho Keldog - R\$ 23,92
104 - Fraldas Super Secão - R\$ 38,61

8 - Adicionar ao carrinho
0 - Voltar
""");

    int opcao = int.tryParse(stdin.readLineSync()!) ?? -1;

    if (opcao == 0) {
      break;
    }

    if (opcao == 8) {
      adicionarProduto(carrinho, precos);
    }
  }
}

void menuServicos(List<String> carrinho, List<double> precos) {
  while (true) {
    print("""
    
201 - Banho e tosa - R\$ 55,99
202 - Tosa higiênica - R\$ 12,99
203 - Hidratação dos pelos - R\$ 20,99

8 - Adicionar ao carrinho
0 - Voltar
""");

    int opcao = int.tryParse(stdin.readLineSync()!) ?? -1;

    if (opcao == 0) {
      break;
    }

    if (opcao == 8) {
      adicionarServico(carrinho, precos);
    }
  }
}

void adicionarProduto(List<String> carrinho, List<double> precos) {
  if (carrinho.length >= 3) {
    print("Seu carrinho já está cheio.");
    return;
  }

  print("Digite o código do produto:");
  int codigo = int.tryParse(stdin.readLineSync()!) ?? 0;

  switch (codigo) {
    case 101:
      carrinho.add("Ração Royal Canin Indoor");
      precos.add(290.00);
      break;

    case 102:
      carrinho.add("Ração Royal Canin Sterilised");
      precos.add(492.00);
      break;

    case 103:
      carrinho.add("Bifinho Keldog");
      precos.add(23.92);
      break;

    case 104:
      carrinho.add("Fraldas Super Secão");
      precos.add(38.61);
      break;

    default:
      print("Código inválido.");
      return;
  }

  print("Produto adicionado ao carrinho.");
}

void adicionarServico(List<String> carrinho, List<double> precos) {
  if (carrinho.length >= 3) {
    print("Seu carrinho já está cheio.");
    return;
  }

  print("Digite o código do serviço:");
  int codigo = int.tryParse(stdin.readLineSync()!) ?? 0;

  switch (codigo) {
    case 201:
      carrinho.add("Banho e tosa");
      precos.add(55.99);
      break;

    case 202:
      carrinho.add("Tosa higiênica");
      precos.add(12.99);
      break;

    case 203:
      carrinho.add("Hidratação dos pelos");
      precos.add(20.99);
      break;

    default:
      print("Código inválido.");
      return;
  }

  print("Serviço adicionado ao carrinho.");
}

void listarCarrinho(List<String> carrinho, List<double> precos) {
  if (carrinho.isEmpty) {
    print("Carrinho vazio.");
    return;
  }

  print("\n=== CARRINHO DE COMPRAS ===");

  for (int i = 0; i < carrinho.length; i++) {
    print("${carrinho[i]} - R\$ ${precos[i].toStringAsFixed(2)}");
  }
}

void finalizarCompra(List<String> carrinho, List<double> precos) {
  if (carrinho.isEmpty) {
    print("Carrinho vazio.");
    return;
  }

  double total = 0;

  for (double preco in precos) {
    total += preco;
  }

  print("Forma de pagamento:");
  print("D - Dinheiro");
  print("C - Cartão");

  String formaPagamento = stdin.readLineSync()!.toUpperCase();

  if (formaPagamento == "D") {
    total = total * 0.9;
  }

  print("Valor final: R\$ ${total.toStringAsFixed(2)}");

  totalVendas++;
  valorTotalVendas += total;

  carrinho.clear();
  precos.clear();
}

void areaRestrita() {
  print("\n=== ÁREA RESTRITA ===");

  print("Nome do cliente:");
  String cliente = stdin.readLineSync()!;

  print("Valor gasto:");
  double valor = double.tryParse(stdin.readLineSync()!) ?? 0;

  print("Forma de pagamento:");
  print("D - Dinheiro");
  print("C - Cartão");

  String formaPagamento = stdin.readLineSync()!.toUpperCase();

  if (formaPagamento == "D") {
    valor = valor * 0.9;
  }

  print("Valor final: R\$ ${valor.toStringAsFixed(2)}");

  totalVendas++;
  valorTotalVendas += valor;
}

void encerrarSistema() {
  print("\n=== SISTEMA ENCERRADO ===");
  print("Quantidade de vendas: $totalVendas");
  print("Valor total vendido: R\$ ${valorTotalVendas.toStringAsFixed(2)}");

  exit(0);
}