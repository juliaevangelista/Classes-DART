class Conta {
  String titular;
  double saldo;

  Conta(this.titular, this.saldo);

  bool sacar(double valor) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      return true;
    } else {
      print("Saldo Insuficiente");
      return false;
    }
  }

  void depositar(double valor) {
    if (valor > 0) {
      saldo += valor;
      print("Depósito de $valor realizado com sucesso.");
    } else {
      print("Valor inválido para depósito");
    }
  }

  bool transferir(double valor, Conta destino) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      destino.depositar(valor);
      print("Transferência de $valor para a conta de ${destino.titular} realizada com sucesso");
      return true;
    } else {
      print("Saldo Insuficiente");
      return false;
    }
  }

  void mostrarSaldo() {
    print("Saldo da conta de $titular: R\$ $saldo");
  }
}

void main() {
  Conta c1 = Conta("Julia", 1200.0);
  Conta c2 = Conta("Juliana", 400.0);

  c1.mostrarSaldo();
  c2.mostrarSaldo();

  c1.depositar(200.0);
  c1.mostrarSaldo();

  c1.sacar(200.0);
  c1.mostrarSaldo();

  c1.transferir(200.0, c2);
  c1.mostrarSaldo();
  c2.mostrarSaldo();
}
