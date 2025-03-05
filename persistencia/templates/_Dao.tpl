
interface {{obj.class_name}}Dao {

  void gravar({{obj.class_name}} {{obj.class_name | lower}});

  void regravar({{obj.class_name}} {{obj.class_name | lower}});

  List<{{obj.class_name}}> recuperarTodos();

  List<{{obj.class_name}}> recuperarPorId(Long id);
  
  void apagar({{obj.class_name}} {{obj.class_name | lower}});
}