#### 表达式

```BNF
<primary-expression> -> <identifier>|<constant>|<string-literal>|<{expression}>|<generic-selection>

<generic-selection> -> _Generic(<assignment-expression>,<generic-assoc-list>>)

<generic-assoc-list> -> <generic-association>|<generation-assoc-list>,<generic-association>

<generic-association> -> <type-name>:<assignment-expression>|default:<assignment-expression>

<postfix-expression> -> <primary-expression>|<postfix-expression[expression]>|<postfix-expression(argument-expression-list_opt)>|<postfix-expression.identifier>|<postfix_expression->identifer>|<postfix-expression++>|<postfix-expression-->|<(type-name){initializer-list}>|<(type-name){initializer-list,}>

<argument-expression-list> -> <assignment-expression>|<argument-expression-list,assignment-expression>

<unary-expression> -> <postfix-expression>|<++unary-expression>|<--unary-expression>|<unary-operator><cast-expression>|sizeof<unary-expression>|sizeof(<type-name>)|_Alignof(<type-name>)

<unary-operator> -> &|*|+|-|~|!

<cast-expression> -> <unary-expression>|<(type-name)><cast-expression>

<multiplicative-expression> -> <cast-expression>|<multiplicative-expression>*<cast-expression>|<multiplicative-expression>/<cast-expression>|<multiplicative-expression>%<cast-expression>>

<additive-expression> -> <multiplicative-expression>|<additive-expression>+<multiplicative-expression>|<additive-expression>-<multiplicative-expression>

<shift-expression> -> <additive-expression>|<shift-expression><<<additive-expression>|<shift-expression>>><additive-expression>

<relational-expression> -> <shift-expression>|<relational-expression><<shift-expression>|<relational-expression>><shift-expression>|<relational-expression><=<shift-expression>|<relational-expression>>=<shift-expression>|

<equality-expression> -> <relational-expression>|<equality-expression>==<relational-expression>|<equality-expression>!=<relational-expression>

<AND-expression> -> <equality-expression>|<AND-expression>&<equality-expression>

<exclusive-OR-expression> -> <AND-expression>|<exclusive-OR-expression>^<AND-expression>

<inclusive-OR-expression> -> <exclusive-OR-expression>|<inclusive-OR-expression>\|<exclusive-OR-expression>

<logical-AND-expression> -<inclusive-OR-expression>|<logical-AND-expression>&&<inclusive-OR-expression>

<logical-OR-expression> -> <logical-AND-expression>|<logical-OR-expression>||<logical-AND-expression>

<conditional-expression> -> <logical-OR-expression>|<logical-OR-expression>?<expression><conditional-expression>

<assignment-expression> -> <conditional-expression>|<unary-expression><assignment-operator><assignment-expression>

<assignment-operator> -> =|*=|/=|+=|-=|<<=|>>=|&=|^=||=

<expression> -><assignment-expression>|<expression>,<assignment-expression>

<constant-expression> -> <conditional-expression>
```

#### 声明

```BNF
<declaration> -> <declaration-specifiers><init-declaration-list_opt>;|<static_assert-declaration>

<declaration-specifiers> -> <storage-class-specifier><declaration-specifiers_opt>|<type-specifier><declaration-specifiers_opt>|<type-qualifier><declaration-specifiers_opt>|<function-specifier><declaration-specifiers_opt>|<alignment-specifier><declaration-specifiers_opt>

<init-declarator-list> -> <init-declarator>|<init-declarator-list>,<init-declarator>

<init-declarator> -> <declarator>|<declarator>=<initializer>

<storage-class-specifier> -> typedef|extern|static|_Thread_local|auto|register

<type-specifier> -> void|char|short|int|long|float|double|signed|unsigned|_Bool|_Complex|<atomic-type-specifier>|<struct-or-union-specifier>|<enum-specifier>|<typedef-name>

<struct-or-union-specifier> -> <struct-or-union><identifier_opt>{<struct-declaration-list>}|<struct-or-union><identifier>

<struct-or-union> -> struct|union

<struct-declaration-list> -> <struct-declaration>|<struct-declaration-list><struct-declaration>

<struct-declaration> -> <specifier-qualifier-list><struct-declarator-list_opt>;|<static_assert-declaration>

<specifier-qualifier-list> -> <type-specifier><specifier-qualifier-list_opt>|<type-qualifier><specifier-qualifier-list_opt>

<struct-declarator> -> <declarator>|<declarator_opt>:<constant-expression>

<enum-specifier> -> enum<identifier_opt>{<enumerator-list>}|enum<identifier_opt>{<enumerator-list>,}|enum<identifier>

<enumerator-list> -> <enumerator>|<enumerator-list>,<enumerator>

<enumerator> -> <enumeration-constant>|<enumeration-constant>=<constant-expression>

<atomic-type-specifier> -> _Atomic(<type-name>)

<type-qualifier> -> const|restrict|volatile|_Atomic

<function-specifier> -> inline|_Noreturn

<alignment-specifier> -> _Alignas(<type-name>)|_Alignas(<constant-expression>)

<declarator> -> <pointer_opt><direct-declarator>

<direct-declarator> -> <identifier>|(<declarator>)|<direct-declarator>[<type-qualifier-list_opt><assignment-expression_opt>]|<direct-declarator>[static<type-qualifier-list_opt><assignment-expression>]|<direct-declarator>[<type-qualifier-list> static <assignment-expression>]|<direct-declarator>[tpye-qualifier-list_opt*]|<direct-declarator>(<parameter-type-list>)|<direct-declarator>(<identifier-list_opt>)

<pointer> -> *<type-qualifier-list_opt>|*<type-qualifier-list_opt><pointer>

<type-qualifier-list> -> <type-qualifier>|<type-qualifier-list><type-qualifier>

<parameter-type-list> -> <parameter-list>|<parameter-list>,...

<parameter-list> -> <parameter-declaration>|<parameter-list>,<parameter-declaration>

<parameter-declaration> -> <declaration-specifiers><declarator>|<declaration-specifiers><abstract-declarator_opt>

<identifier-list> -> <identifier>|<identifier-list>,<identifier>

<type-name> -> <specifier-qualifier-list><abstract-declarator_opt>

<abstract-declarator> -> <pointer>|<pointer_opt><direct-abstract-declarator>

<direct-abstract-declarator> -> (<abstract-declarator>)|<direct-abstract-declarator_opt>[<type-qualifier-list_opt><assignment_expression_opt>]|<direct-abstract-declarator_opt>[static<type-qualifier-list_opt><assignment-expression>]|<direct-abstract-declarator_opt>[<type-qualifier-list>static<assignment-expresion>]|<direct-abstract-declarator_opt>[*]|<direct-abstract-declarator_opt>(<parameter-type-list_opt>)

<typedef-name> -> <identifier>

<initializer> -> <assigment-expression>|{<initializer-list>}|{<initializer-list>,}

<initializer-list> -> <designation_opt><initializer>|<initializer-list>,<designation_opt><initializer>

<designation> -> <designator_list>=

<designation-list> -> <designator>|<designator-list><designator>

<designator> -> [<constant-expresion>]|.<identifier>

<static_assert-declaration> -> _Static_assert(<constant-expression>,<string-literal>);
```

#### 语句

```BNF
<statement> -> <labeled-statement>|<compound-statement>|<expression-statement>|<selection-statement>|<iteration-statement>|<jump-statement>

<labeled-statement> -> <identifier>:<statement>|case<constant-expression>:<statement>|default:<statement>

<compound-statement> -> {<block-item-list_opt>}

<block-item-list> -> <block-item>|<block-item-list><block-item>

<block-item> -> <declaration>|<statement>

<expression-statement> -> <expression_opt>;

<selection-statement> -> if(<expression>)<statement>|if(<expression>)<statement> else <statement>|switch(<expression>)<statement>

<iteration-statement> -> while(<expression>)<statement>|do<statement>while(<expression>);|for(expression_opt;expression_opt;expression_opt)<statement>|for(decleartion expression_opt;expression)<statement>

<jump-statement> -> goto<identifier>;|continue;|break;|return expression_opt;
```