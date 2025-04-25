# pip install lxml
from lxml import etree

with open("q11.dtd") as f:
    dtd = etree.DTD(f)

tree = etree.parse("q11.xml")

if dtd.validate(tree):
    print("XML is valid!")
else:
    print("XML is invalid!")
    print(dtd.error_log.filter_from_errors()[0])