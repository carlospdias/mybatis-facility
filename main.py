import json
from jinja2 import Environment, FileSystemLoader
from persistencia.dao_generate import DaoGenerate


def read_json_file(filename='entrada.json'):
    data = None
    with open (file=filename, encoding='utf-8', buffering=1024, mode="r") as rd:
        data = rd.read()
    
    if data:
        return json.loads(data)


json_source = read_json_file(filename='base.json')

dao = DaoGenerate(json_source)
dao.generateDao()

print("fim ... ")