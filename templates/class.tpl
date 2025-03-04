
public class {{obj.class_name}} {
  {% for field in obj.fields %}
  private  javaType="{{field.javaType}}" property="{{field.property}}";
  {% endfor %}
 
}