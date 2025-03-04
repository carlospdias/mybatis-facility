import json
from jinja2 import Environment, FileSystemLoader


def read_json_file(filename='entrada.json'):
    data = None
    with open (file=filename, encoding='utf-8', buffering=1024, mode="r") as rd:
        data = rd.read()
    
    if data:
        return json.loads(data)


json_mt = read_json_file(filename='base.json')


environment = Environment(loader=FileSystemLoader("templates/"))
template = environment.get_template("mybatis-mapper.tpl")


object_list = []
for config in json_mt:
    content = template.render( obj = config)

    print(content)
    print('...'*15)
