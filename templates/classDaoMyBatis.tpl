
class {{obj.class_name}}DaoMyBatis implements  {{obj.class_name}}Dao {

  private Session session;

  public {{obj.class_name}}DaoMyBatis(Session session){
    this.session = session;
  }
  void gravar({{obj.class_name}} obj){
    this.session.insert("", obj);

  }

  void regravar({{obj.class_name}} obj){
    this.session.update("", obj);
  }

  List<{{obj.class_name}}> recuperarTodos(){
    this.session.select("", obj);
  }

  List<{{obj.class_name}}> recuperarPorId(Long id){
    this.session.select("", id);
  }
  
  void apagar({{obj.class_name}} obj){
    this.session.delete("", obj);
  }
}