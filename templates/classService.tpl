
@Service
class {{obj.class_name}}Service {

  private final static Logger LOGGER = LoggerFactory.getClass({{obj.class_name}}Service.class);

  private  {{obj}}Dao dao;


  public {{obj.class_name}}Service({{obj}}Dao dao){
    this.dao = dao;
  }
  void adicionar({{obj.class_name}} obj){
    try{
      this.dao.gravar(obj);
    }
    catch(e){
      LOGGER.error("Falha {}", e.getMessage());
      
    }
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