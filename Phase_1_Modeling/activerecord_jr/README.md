## Learning Goals:

- Practice SQL queries/refactoring
- Understand the role/value of an ORM
- Explore metaprogramming techniques

## Assignment

Implement Active Record Jr., a basic SQL/Ruby ORM.

### Parts 1+2:

Refactor the ```Student``` and ```Cohort``` classes to move similar methods into the general ```Database::Model``` class. 

#### Methods Include:
1. ```Student.all``` and ```Cohort.all```
2. ```Student.create``` and Cohort.create```
3. ```Student.where``` and Cohort.where```
4. ```Student.find``` and Cohort.find```
5. ```Student#new_record?``` and Cohort#new_record?```
6. ```Student#insert!``` and Cohort#insert!```
7. ```Student#update!``` and Cohort#update!```

### Parts 3+4
Make use of metaprogramming techniques including ```ruby self.inherited```, ```ruby define_method```, and the PRAGMA statement in SQLite to:

1. Extract class attribute names from the table headers directly.
2. Programatically define getter and setter methods for those attributes.
3. Determine the tablename from the class name, by converting it from camel case to snake case than pluralizing.