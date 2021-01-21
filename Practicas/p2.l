minus	[a-z]
mayus	[A-Z]
num		[0-9]

abc		[{minus}|{mayus}]
alfanum [{abc}|{numero}]

signo	(\+)
prefijo	({signo}?{num}{11})
tfno	({num}{9})

dominio	(\.{abc}+)
correo	(({alfanum})+\@{dominio})

username("clara123"|"frankyyy"|"b0nez"|"nana")

%%
{prefijo}	{printf ("Prefijo válido: %s\n",  yytext);}
{tfno}		{printf ("Telefono válido: %s\n", yytext);}
{correo}		{printf ("Correo válido: %s\n",   yytext);}
{username}	{printf ("Usuario válido: %s\n",  yytext);}
.+				{printf ("Incorrecto: %s\n",      yytext);}
%%
int yywrap(){
	return 1;
}

int main(){
	yylex();
	return 1;
}

