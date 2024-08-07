import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @observable
  double totalCompra = 0;

  @computed
  int get quantidadeItem => listaItem.length;

  @computed
  bool get listaVazia => listaItem.isEmpty;

  @action
  void adicionaCarrinho(Item item) {
    listaItem.add(item);
    atualizaTotalCompra();
  }

  @action
  void removeCarrinho(Item item) {
    listaItem.remove(item);
    atualizaTotalCompra();
  }

  @action
  void atualizaTotalCompra() {
    totalCompra = 0;
    listaItem.forEach((element) {
      totalCompra += element.preco;
    });
  }

}