class Conta {
  String _titular;
  double _saldo;

  Conta(this._titular, this._saldo);

  String get titular => _titular;

  set titular(String novoTitular) {
    if (novoTitular.isNotEmpty) {
      _titular = novoTitular;
    }
  }

  double get saldo => _saldo;

  void depositar(double valor) {
    if (valor > 0) {
      _saldo += valor;
      print("Depósito de R\$ $valor realizado com sucesso.");
    } else {
      print("Valor inválido para depósito.");
    }
  }

  bool sacar(double valor) {
    if (valor > 0 && valor <= _saldo) {
      _saldo -= valor;
      print("Saque de R\$ $valor realizado com sucesso.");
      return true;
    } else {
      print("Saldo insuficiente ou valor inválido para saque.");
      return false;
    }
  }

  bool transferir(double valor, Conta destino) {
    if (valor > 0 && valor <= _saldo) {
      _saldo -= valor;
      destino.depositar(valor);
      print("Transferência de R\$ $valor para a conta de ${destino.titular} realizada com sucesso.");
      return true;
    } else {
      print("Saldo insuficiente ou valor inválido para transferência.");
      return false;
    }
  }

  void mostrarSaldo() {
    print("Saldo da conta de $_titular: R\$ $_saldo");
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
