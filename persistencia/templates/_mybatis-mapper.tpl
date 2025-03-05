<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="{{obj.namespace}}.{{obj.class_name}}">
 
  <resultMap id="{{obj.class_name}}ResultMap" type="{{obj.package}}.{{obj.class_name}}">
    {%- for field in obj.fields -%}
    {% if field.is_id == 'True' %}
    <id  property="{{field.property}}" column="{{field.column}}" javaType="{{field.javaType}}" jdbcType="{{field.jdbcType}}" />
    {%- else -%}
    <result  property="{{field.property}}" column="{{field.column}}" javaType="{{field.javaType}}" jdbcType="{{field.jdbcType}}" />
    {%- endif %} 
    {% endfor %}
  </resultMap>
  
  <select id="select_byId" resultMap="{{obj.class_name}}ResultMap">
      SELECT  
        {% for field in obj.fields -%}
          {{obj.table_alias}}.{{field.column}},
        {% endfor %}
      FROM
          {{obj.table}} {{obj.table_alias}}
      WHERE {{obj.table_alias}}.{{obj.id_column}} = #{id}  
  </select>

  <select id="select_all" resultMap="{{obj.class_name}}ResultMap">
      SELECT  
        {% for field in obj.fields -%}
        {{obj.table_alias}}.{{field.column}},
        {% endfor %} 
      FROM 
        {{obj.table}} {{obj.table_alias}}
  </select>

  <insert id="insert" useGeneratedKeys="true" keyProperty="id">
      INSERT INTO {{obj.table}}
        {% for field in obj.fields -%}
          ({{field.column}}),
        {% endfor %}
      VALUES (
        {% for field in obj.fields -%}
        #{ {{-field.property -}} },
        {% endfor %})
        <selectKey resultType="Long" order="BEFORE" keyColumn="ID" keyProperty="id">
          CALL IDENTITY()
        </selectKey>
  </insert>

  <update id="update">
      UPDATE {{obj.table}} SET 
        {% for field in obj.fields -%}
        {%- if field.is_id == 'False' -%}
        {{ field.column }}= #{ {{- field.property -}} },
        {% endif %} 
        {%- endfor %}
      WHERE 
        {{obj.id_column}} = #{id}  
  </update>

  <delete id="delete">
      DELETE FROM {{obj.table}} WHERE {{obj.id_column}} = #{id}  
  </delete>
</mapper>