def generate_fsa_of_lisp_list(s):
    # s = s.replace('\n', '')
    print ast.literal_eval(s)


s = '''
('MKPLV',
 ('SRODG+sqmubwd',),
 ('CTIRD+lakjvoq',),
 (('SRODG+sqmubwd', 'F', 'SRODG+pfhtxfo',)
  ('BIVXY+hbbcycp', 'S', 'BIVXY+acwqwhq',)
  ('CTIRD+ojwaeow', 'A', 'CTIRD+lakjvoq',)
  ('BIVXY+acwqwhq', 'A', 'CTIRD+lakjvoq',)
  ('SRODG+pfhtxfo', 'S', 'BIVXY+acwqwhq',)))

'''

print generate_fsa_of_lisp_list(s)