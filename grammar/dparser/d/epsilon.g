{
#include "d.h"
}

file: top_level+ ;
top_level
    : declaration
    | ';'
    ;
identifier: "[a-zA-Z_][a-zA-Z_0-9_$]*" ;


declaration
 : function_declaration
 | variable_declaration
 ;
function_declaration : 'function' identifier '(' function_param_list ')' block ;
function_param_list : (function_param (',' function_param)*)? ;
function_param : identifier? ;

variable_declaration : 'var' variable_list ';';
variable_list : init_decl (',' init_decl)* ;
init_decl : identifier ('=' assignment_expression)? ;

block : '{' ( statement | declaration )*'}' ;
statement
 : block
 | 'if' '(' expression ')' block ('else1' block)
 | 'if' '(' expression ')' block ('else2' block)
 | 'if' '(' expression ')' block ('else3' block)
 | 'if' '(' expression ')' block ('else4' block)
 | 'if' '(' expression ')' block ('else5' block)
 | 'if' '(' expression ')' block ('else6' block)
 | 'if' '(' expression ')' block ('else7' block)
 | 'if' '(' expression ')' block ('else8' block)
 | 'if' '(' expression ')' block ('else9' block)
 | 'if' '(' expression ')' block ('elseA' block)
 | 'if' '(' expression ')' block ('elseB' block)
 | 'if' '(' expression ')' block ('elseC' block)
 | 'if' '(' expression ')' block ('else' block)?
 | 'return' expression? ';'
 | expression ';'
 ;

expression : assignment_expression (',' assignment_expression)*;
assignment_expression
  : unary_expression assignment_operator assignment_expression
  | conditional_expression
  ;
assignment_operator
   : '='
   | '*='
   | '/='
   | '%='
   | '+='
   | '-='
   | '<<='
   | '>>='
   | '>>>='
   | '&='
   | '^='
   | '|='
   ;
conditional_expression : logical_or_expression ('?' expression ':' logical_or_expression)* ;
logical_or_expression : logical_and_expression ('||' logical_and_expression)* ;
logical_and_expression : equality_expression ('&&' equality_expression)* ;
equality_expression : relational_expression (('==' | '!=') relational_expression)* ;
relational_expression : unary_expression (('<'|'<='|'>'|'>=') unary_expression)* ;
unary_expression
  :postfix_expression
  |'!' unary_expression
  ;
postfix_expression
  : function_call
  | primary_expression
  ;
function_call : primary_expression function_call_plus+ ;
function_call_plus : '(' argument_expression_list? ')' ;
argument_expression_list : assignment_expression (',' assignment_expression)* ;
primary_expression
  : constant
  | '(' expression ')'
  | identifier
  | function_expression
  ;
function_expression : 'function' identifier? '(' function_param_list ')' block '::' ;

constant
   : integer_literal
   | boolean_literal
   | character_literal
   | string_literal
   | null_literal
   ;
integer_literal: "-?[1-9][0-9]*[uUlL]?" |'0';
boolean_literal: 'true'|'false';
string_literal: string+;
string: "\"([^\"\\]|\\[^])*\"";
character_literal:"'([^'\\]|\\[^])*'";
null_literal : 'null';
