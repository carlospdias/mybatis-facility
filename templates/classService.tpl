
class {{obj.class_name}}Service {

  private  {{obj}}Dao dao;


  public {{obj.class_name}}Service({{obj}}Dao dao){
    this.dao = dao;
  }
  void adicionar({{obj.class_name}} obj){
    this.session.insert("", obj);

  }

  void atualizar({{obj.class_name}} obj){
    this.session.update("", obj);
  }

  List<{{obj.class_name}}> buscarTodos(){
    this.session.select("", obj);
  }

  List<{{obj.class_name}}> buscarPorid(Long id){
    this.session.select("", id);
  }
  
  void excluir({{obj.class_name}} obj){
    this.session.delete("", obj);
  }
}