-- returns one calculated field with name ‘person_information’ in one string:
-- Anna (age:16,gender:'female',address:'Moscow')

SELECT CONCAT(name, ' (age:', age, ',gender:''', gender, ''',address:''', address, ''')')
           AS person_information
FROM person
ORDER BY person_information;


