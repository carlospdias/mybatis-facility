
@Service
class {{obj.class_name}}Service {

  private  {{obj}}Dao dao;


  public {{obj.class_name}}Service({{obj}}Dao dao){
    this.dao = dao;
  }
  void adicionar({{obj.class_name}} obj){
    this.dao.gravar(obj);

  }

  void atualizar({{obj.class_name}} obj){
    this.dao.regravar(obj);
  }

  List<{{obj.class_name}}> buscarTodos(){
    return this.dao.recuperar();
  }

  {{obj.class_name}} buscarPorId(Long id){
    return this.dao.recuperarPorId(id);
  }
  
  void excluir({{obj.class_name}} obj){
    return this.dao.apagar(obj);
  }
}