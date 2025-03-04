
@Controller
class {{obj.class_name}}Controller {

  private final static Logger LOGGER = LoggerFactory.getClass({{obj.class_name}}Service.class);

  private  {{obj}}Service service;


  public {{obj.class_name}}Controller({{obj}}Service service){
    this.service = service;
  }
  
}