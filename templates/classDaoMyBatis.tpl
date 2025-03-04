
@Repository
class {{obj.class_name}}DaoMyBatis implements  {{obj.class_name}}Dao {

  private Session session;

  public {{obj.class_name}}DaoMyBatis(Session session){
    this.session = session;
  }
  void gravar({{obj.class_name}} obj){
    this.session.insert("{{obj.namespace}}.insert", obj);

  }

  void regravar({{obj.class_name}} obj){
    this.session.update("{{obj.namespace}}.update", obj);
  }

  List<{{obj.class_name}}> recuperarTodos(){
    this.session.select("{{obj.namespace}}.select", obj);
  }

  {{obj.class_name}} recuperarPorId(Long id){
    this.session.select("{{obj.namespace}}.selectById", id);
  }
  
  void apagar({{obj.class_name}} obj){
    this.session.delete("{{obj.namespace}}.delete", obj);
  }
}