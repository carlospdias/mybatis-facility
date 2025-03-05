
interface TelefoneDao {

  void gravar(Telefone telefone);

  void regravar(Telefone telefone);

  List<Telefone> recuperarTodos();

  List<Telefone> recuperarPorId(Long id);
  
  void apagar(Telefone telefone);
}