from jinja2 import Environment, FileSystemLoader
import os

class DaoGenerate(object):

    def __init__(self, json_source):
        self.source = json_source
        dir_path = os.path.dirname(os.path.realpath(__file__))
        self.output_dir = dir_path + "/output"
        self.env    =  Environment(loader=FileSystemLoader(dir_path + "/templates/"))
        if not os.path.exists(self.output_dir):
            os.makedirs(self.output_dir)

    def __store__(self, filename, data):
        with open(file=self.output_dir + "/" +filename, buffering=128, encoding="utf-8", mode="w") as fw:
            fw.write(data)
        
    def _generate_MyBatisMappers(self):
        template = self.env.get_template("_mybatis-mapper.tpl")
        for config in self.source:
            content = template.render( obj = config)
            name = config['class_name'].lower()+"-mapper.xml"
            self.__store__(name, content)
    
    def _generate_IntefaceDao(self):
        template = self.env.get_template("_Dao.tpl")
        for config in self.source:
            content = template.render( obj = config)
            name = config['class_name']+"Dao.java"
            self.__store__(name, content)

    def generateDao(self):
        self._generate_MyBatisMappers()
        self._generate_IntefaceDao()
        

