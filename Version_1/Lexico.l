%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <stdbool.h>
	#include "y.tab.h"
	
	int linea = 1;
	int Contador = 0;

	typedef struct ID {
	char Nombre[30];
	int Pos;
	struct ID *Sig;
	} Id;
	
	Id *Inicio = NULL;
	Id *Ultimo = NULL;
	
	Id *Anadir(Id *Anterior, char *ident) {
		Id *NuevoId = malloc(sizeof(Id));
		strcpy(NuevoId->Nombre, ident);
		NuevoId->Pos = Contador;
		NuevoId->Sig = NULL;
			if(Anterior != NULL) {
				Anterior->Sig = NuevoId;
			}
		//printf("\n ID %d", NuevoId->Pos);
		Contador++;
		return NuevoId;
	}

	
	bool Encontrar(char *n) {
		bool I = false;
		Id *Actual = Inicio;
		while(Actual != NULL) {
			if(strcmp(Actual->Nombre, n) == 0){
				//printf("\n ID %d", Actual->Pos);
				I = true;
			}
			Actual = Actual->Sig;
		}
		return I;
	}

	void Insertar(char *ident){
		if(Inicio == NULL ) {
			Inicio = Anadir(NULL, ident);
			Ultimo = Inicio;
		} else {
			if(Encontrar(ident)==false){
				Ultimo = Anadir(Ultimo, ident);
			}
		}
	}                       
	

	

%}
id [a-zA-Z_][a-zA-Z_0-9-]*
Cadena \[a-zA-Z0-9_]*
%option yylineno
%%

[0-9] {return DIGITO;}
[0-9][0-9]+ {yylval.Numeros=atoi(yytext); return NUMERO;}
{Cadena} {return TEXTO;}
"event" return EVENTO;
"in" return IN;
"while" return WHILE;
"for" return FOR;
"foreach" return FOREACH;
"do" return DO;
"if" return IF;
"switch" return SWITCH;
"else" return ELSE;
"case" return CASE;
"function" return FUNCION;
"true" return AFIRMACION;
"false" return NEGACION;
"def" return DEFINIRID;
"=" return ASIGNACION;
"(" return PARIZQ;
")" return PARDER;
"[" return CORIZQ;
"]" return CORDER;
"{" return LLAVEIZQ;
"}" return LLAVEDER;
"print"|"write" return IMPRESION;
"println"|"writeline" return IMPRESIONLINEA;
"nextLine"|"nextByte"|"nextDouble"|"nextFloat"|"nextInt"|"nextLong"|"nextShort"|"ReadLine"|"ReadKey" return LECTURA;
"+"|"-"|"*"|"/" return OPERADORARITMETICO;
"=="|">="|"<="|"!="|">"|"<"|"?:" return OPRELACIONAL;
"int"|"double"|"float"|"decimal"|"string"|"byte"|"short"|"long"|"char"|"bool"|"sbyte"|"ushort"|"ulong"|"var"|"ushort"|"uint"|"longbinary"|"blob"|"varbinary"|"varchar"|"binary"|"tinyint"|"longchar"|"dec" return TIPODATO;
"return" return RETORNAR;
"null" return NULO;
"readonly"|"abstract"|"async"|"event"|"extern"|"in"|"new"|"out"|"override"|"sealed"|"static"|"unsafe"|"virtual"|"volatile" return MODIFICADOR;
"continue" return CONTINUAR;
"break" return BREAK;
"goto" return GOTO;
":" return DOSPUNTOS;
";" return PUNTOCOMA;
"," return COMA;
"@|'|""" return PUNTUACION;
"+-"|"-="|"*="|"/=" return ASIGNAR;
"++" return INCREMENTO;
"End" return END;
"as" return COMO;
"Loop" return LOOP;
"public"|"private"|"protected"|"internal" return TIPOPROTECCION;
"interface" return INTERFAZ;
"class" return CLASE;
"struct" return ESTRUCTURA;
"%" return MODULO;
"void" return VOID;
"args" return ARGUMENTO;
"ConvertTo" return CONVERTIR;
"Parse" return CONVERTIR;
"main" return MAIN;
"delegate" 	return DELEGAR;
"Add" return ANADIR;
"List" return LISTA;
"LinkedList" return LISTALIGADA;
"Stack" return PILA;
"QueueData" return COLA;
"order by" return ORDERNAR;
"Count" return CONTAR;
"Clear" return LIMPIAR;
"Contains" return CONTIENE;
"Remove" return REMOVE;
"RemoveAt" return REMOVEAT;
"Push"|"Queue" return INSERTAR;
"Pop"|"Dequeue" return REMOVER;
"Peek" return PEEK;
"FileStream" return ARCHIVO;
"BinaryReader" return LECTORBINARIO;
"Equals" return COMPARACIONIGUAL;
"~" return DESTRUCTOR;
"&&"|"!"|"||" return OPERADORLOGICO;
"using" return UTILIZANDO;
"object" return OBJETO;
"get" return DESCGET;
"set" return DESCSET;
"ref"|"out" return REFERENCIA;
"group" return 	AGRUPAR;
"by" return POR;
"assert" return PREDICADO;
"exports" return EXPORTAR;
"extends" return EXTIENE;
"implements" return IMPLEMENTA;
"instance of" return INSTANCIADE;
"module" return DECMODULO;
"native" return NATIVO;
"package" return PAQUETE;
"requieres" return REQUIERE;
"strictfp" return RESREDONDEO;
"super" return SUPER;
"synchronized" return BLOQUEOMUTEX;
"transient" return TRANSIENT;
"exec"|"execute" return EJECUTAR;
"ascii" return ASCII;
"Max" return MAXIMO;
"Min" return MINIMO;
"all" return ALLVERDADERO;
"sum" return SUMIZQDER;
"bin" return RETORNARBIN;
"naked" return NAKED;
"dllimport" return IMPORTARDLL;
"typename" return NOMBRETIPO;
"register" return REGISTRAR;
"fixed" return FIJO;
"lock" return LOCK;
"noreturn" return SINRETORNO;
"noop" return NOOP;
"assime" return ASSIME;
"based" return BASED;
"raise" return RAISE;
"notable" return NOTABLE;
"mutable" return MUTABLE;
"property" return PROPIEDAD;
"fastcall" return FASTCALL;
"stackalloc" return ALOJARPILA;
"pin" return PIN;
"assertion" return ASSERTION;
"alter" return ALTER;
"AVG" return PROMEDIO;
"connect" return CONECTAR;
"container" return CONTENEDOR;
"currency" return MONEDA;
"close" return SALIDA;
"drop" return DROP;
"exists" return EXISTE;
"open" return ABRIR;
"SQL" return SQL;
"user" return USUARIO;
"year" return YEARS;
"skip" return SKIP;
"#ExternalSource" return EXTERNALSOURCE;
"isTrue" return ISTRUE;
"mid" return MID;
"until" return HASTA;
"#Region" return REGION;
"take" return TOMAR;
"GetXMLNamespace" return OBTENERXML;
"YESNO" return SINO;
"must override" return SOBREESCRIBIR;
"optional" return OPTIONAL;
"RaiseEvent" return GENERAREVENTO;
"Stop" return PARAR;
"Start" return EMPEZAR;
"Xor" return XOR;
"Widening" return EXPANDIR;
"synclock" return SYNCLOCK;
"shadows" return SHADOWS;
"top" return TOP;
"selectschema" return SELECTESQUEMA;
"coalesce" return COALESCE;
"between" return ENTRE;
"admindb" return ADMINDB;
"strcpy" return COPIARSTRING;
"strncpy" return COPIARCARACTER;
"strcmp" return COMPARARSTRING;
"strlen" return DETLONGITUD;
"strcat" return CONCATSTRING;
"strchr" return PRIMERAOCURRENCIA;
"strtok" return DELIMTOKEN;
"isalnum" return ESALFANUMERICO;
"isalpha" return ESALFABETICO;
"isdigit" return ESDIGITO;
"isPower" return ISPOWER;
"domain" return DOMAIN;
"percent" return PORCENTAJE;
"view" return VIEW;
"default" return DEFAULT;
"method" return METODO;

{id} {return IDEN;}

"\n" {linea++;}
%%


int yywrap(void)
{
   return 1;
}
