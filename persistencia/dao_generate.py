from jinja2 import Environment, FileSystemLoader
import os

class DaoGenerate(object):

    def __init__(self, json_source):
        self.source = json_source
        dir_path = os.path.dirname(os.path.realpath(__file__))
        self.env    =  Environment(loader=FileSystemLoader(dir_path + "/templates/"))
        
        
    def _generate_MyBatisMappers(self):
        template = self.env.get_template("_mybatis-mapper.tpl")
        for config in self.source:
            content = template.render( obj = config)
            print(content)
    

    def generateDao(self):
        self._generate_MyBatisMappers()
        

