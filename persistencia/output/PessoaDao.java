
interface PessoaDao {

  void gravar(Pessoa pessoa);

  void regravar(Pessoa pessoa);

  List<Pessoa> recuperarTodos();

  List<Pessoa> recuperarPorId(Long id);
  
  void apagar(Pessoa pessoa);
}