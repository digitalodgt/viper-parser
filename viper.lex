package Viper;

import java_cup.runtime.Symbol;

%%

%cup

%state COMMENT
%state STRING
%state STRINGQ

SEMI = ";" 
WHITE = (" "|\t|\n|\r)

MINUSCULAS = [a-z]
MAYUSCULAS = [A-Z]
ALFANUM = [a-zA-Z0-9]
DIGIT = [0-9]
BOOL = ("true"|"false")
QUOT = "\""
CHARS = [^{QUOT}]+
COMI = "'"
CHARSCOM = [^{COMI}]+

%%


<YYINITIAL>{SEMI}   	{ return new Symbol( sym.SEMI );   }

<YYINITIAL>{WHITE}  	{  }

<YYINITIAL>"-"		{ return new Symbol( sym.MINUS );	}

<YYINITIAL>"+"		{ return new Symbol( sym.PLUS );	}

<YYINITIAL>"*"		{ return new Symbol( sym.MULT );	}

<YYINITIAL>"/"		{ return new Symbol( sym.DIV );	}

<YYINITIAL>"%"		{ return new Symbol( sym.MOD );	}

<YYINITIAL>"="		{ return new Symbol( sym.EQ );		}

<YYINITIAL>"("		{ return new Symbol( sym.LPAREN );	}

<YYINITIAL>")"		{ return new Symbol( sym.RPAREN );	}

<YYINITIAL>":"		{ return new Symbol( sym.COLON );	}

<YYINITIAL>"{"		{ return new Symbol( sym.LBRACE );	}

<YYINITIAL>"}"		{ return new Symbol( sym.RBRACE );	}

<YYINITIAL>"=="		{ return new Symbol( sym.COMP );	}

<YYINITIAL>"<"		{ return new Symbol( sym.LT );		}

<YYINITIAL>"<="		{ return new Symbol( sym.LE );		}

<YYINITIAL>"if"		{ return new Symbol( sym.IF );		}

<YYINITIAL>"int"	{ return new Symbol( sym.INT );	}

<YYINITIAL>"bool"	{ return new Symbol( sym.BOOL );	}

<YYINITIAL>"str"	{ return new Symbol( sym.STR );	}

<YYINITIAL>"def"	{ return new Symbol( sym.DEF );	}

<YYINITIAL>"else"	{ return new Symbol( sym.ELSE );	}

<YYINITIAL>"while"	{ return new Symbol( sym.WHILE );	}

<YYINITIAL>"return"	{ return new Symbol( sym.RETURN );	}

<YYINITIAL>"void"	{ return new Symbol( sym.VOID );	}

<YYINITIAL>"!"		{ return new Symbol( sym.NEG );	}

<YYINITIAL>{QUOT}	{ yybegin( STRINGQ );	}

<STRINGQ>{CHARS}	{ return new Symbol( sym.STR_CONST, yytext() );	}

<STRINGQ>{QUOT}		{ yybegin( YYINITIAL);	}

<YYINITIAL>{COMI}	{ yybegin( STRING );	}

<STRING>{CHARSCOM}	{ return new Symbol( sym.STR_CONST, yytext() );		}

<STRING>{COMI}		{ yybegin( YYINITIAL);	}

<YYINITIAL>{DIGIT}{DIGIT}*	{ return new Symbol( sym.INT_CONST, Integer.parseInt( yytext() ) );	}

<YYINITIAL>{BOOL}	{return new Symbol( sym.BOOL_CONST, yytext() );		}

<YYINITIAL>{MINUSCULAS}+{ALFANUM}*	{return new Symbol( sym.ID, yytext() );	}

<YYINITIAL>"#"		{ yybegin( COMMENT );			}

<COMMENT>\n		    { yybegin( YYINITIAL );			}

<COMMENT>.		    { }

<YYINITIAL>.        { System.out.println("Found: " + yytext()); }
