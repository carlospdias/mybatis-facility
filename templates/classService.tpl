
@Service
class {{obj.class_name}}Service {

  private  {{obj}}Dao dao;


  public {{obj.class_name}}Service({{obj}}Dao dao){
    this.dao = dao;
  }
  void adicionar({{obj.class_name}} obj){
    this.session.insert("{{obj.namespace}}.insert", obj);

  }

  void atualizar({{obj.class_name}} obj){
    this.session.update("{{obj.namespace}}.update", obj);
  }

  List<{{obj.class_name}}> buscarTodos(){
    this.session.select("{{obj.namespace}}.select", obj);
  }

  {{obj.class_name}} buscarPorid(Long id){
    this.session.select("{{obj.namespace}}.selectById", id);
  }
  
  void excluir({{obj.class_name}} obj){
    this.session.delete("{{obj.namespace}}.delete", obj);
  }
}