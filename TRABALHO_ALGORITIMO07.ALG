 //Nome: Vinicius Moraes Contini  RA= 22201761-2
Algoritmo "Trabalho_Algoritimo"
//
//

Var
   cod:vetor[1..1000] de caracter
   des:vetor[1..1000] de caracter
   prec:vetor[1..1000] de real
   linha:caracter
   y,x,tot:inteiro
   cot:real

   //==============================================================================

Procedimento ler_arquivo
arquivo "dadosi.txt"
var
   tmp:caracter

inicio
   para x de 1 ate tot faca
      leia(linha)
      se x > 7 entao
         cod[x-7] := copia(linha,1,10)
         cod[x-7] := remove_final(cod[x-7])
         cod[x-7] := remove_inicio(cod[x-7])
         des[x-7] := copia(linha,11,57)
         tmp := copia(linha,68,9)
         prec[x-7]:=CARACPNUM(tmp)

      fimse
   fimpara
   tot := tot-7
   // cod := cod-7
   // des := des-7
   // tmp := tmp-7
fimprocedimento

//==============================================================================

Funcao remove_inicio (s: caracter):caracter
Inicio
   Enquanto (copia(s,1,1)=" ") faca
      s := copia(s,2,10)
   Fimenquanto
   Retorne(s)
Fimfuncao
//------------------------------------------------------------------------------
Funcao remove_final (s: caracter):caracter
Inicio
   Enquanto (copia(s,compr(s),1)=" ") faca
      s := copia(s,1,(compr(s)-1))
   Fimenquanto
   Retorne(s)
Fimfuncao
//==============================================================================

Procedimento QuickSortCodigo(iniVet, fimVet: inteiro)
var
   i,j,x: inteiro
   pivo: caracter
inicio
   i <- inivet
   j <- fimvet
   x <- (iniVet + fimVet) div 2
   pivo <- (cod[x])
   repita
      enquanto (cod[i] < pivo) faca
         i <- i + 1
      fimenquanto
      enquanto (cod[j] > pivo) faca
         j <- j - 1
      fimenquanto
      se (i <= j) entao
         troca(i,j)
         i <- i+1
         j <- j-1
      fimse
   ate (i > j)
   se (j > iniVet) entao
      QuickSortCodigo(iniVet, j)
   fimse
   se (i < fimVet) entao
      QuickSortCodigo(i, fimVet)
   fimse
fimprocedimento

//==============================================================================

Procedimento troca(a,b:inteiro)
var
   tmpCaracter: caracter
   tmpReal: real
inicio
   tmpCaracter:=cod[a]
   cod[a]:=cod[b]
   cod[b]:=tmpCaracter

   tmpCaracter:=des[a]
   des[a]:=des[b]
   des[b]:=tmpCaracter

   tmpReal:=prec[a]
   prec[a]:=prec[b]
   prec[b]:=tmpReal
fimprocedimento

//==============================================================================

Procedimento QuickSortDes(iniVet, fimVet: inteiro)
var
   i,j,x: inteiro
   pivo : caracter
inicio
   i <- inivet
   j <- fimvet
   x <- (iniVet + fimVet) div 2
   pivo <- (des[x])
   repita
      enquanto (des[i] < pivo) faca
         i <- i + 1
      fimenquanto
      enquanto (des[j] > pivo) faca
         j <- j - 1
      fimenquanto
      se (i <= j) entao
         troca(i,j)
         i <- i+1
         j <- j-1
      fimse
   ate (i > j)
   se (j > iniVet) entao
      QuickSortdes(iniVet, j)
   fimse
   se (i < fimVet) entao
      QuickSortdes(i, fimVet)
   fimse
fimprocedimento

//==============================================================================

Procedimento pesquisa_nome

var
   parada,pesq,temp: caracter
   tpesq: inteiro

inicio
   limpatela

   escreval("      Digite uma descrição a ser encontrada em caixa alta por favor:")
   leia(pesq)
   tpesq := compr(pesq)
   para  x de 1 ate tot  faca
      para y de 1 ate compr(des[x]) faca
         temp := copia (des[x],y,tpesq)
         se (temp= pesq) entao
            escreval("     CODIGO:",cod[x],"     NOME:",des[x],"      PREÇO  -  US$--",prec[x]:7:2,"     PREÇO  -  RS$--",prec[x]*cot:7:2)
         fimse

      fimpara
   fimpara
   escreval
   escreval
   escreval("Precione ENTER para voltar ao menu ")
   leia(parada)
fimprocedimento

//==============================================================================

Procedimento    pesquisa_porcodigo

var
   psq,parada: caracter
   //x: inteiro
inicio
   limpatela
   escreval("  Digite o codigo  a ser encontrado: ")
   leia(psq)
   para x de 1 ate tot faca
      se (psq=cod[x]) entao
         escreval("     CODIGO:",cod[x],"     NOME:",des[x],"     PREÇO  -  US$--",prec[x]:7:2,"     PREÇO  -  RS$--",prec[x]*cot:7:2)

      fimse
   fimpara
   escreval
   escreval
   escreval("Precione ENTER para voltar ao menu ")
   leia(parada)
fimprocedimento

//==============================================================================

Procedimento mostra_tudo
var
   parada: caracter
inicio
   limpatela
   para x de 1 ate tot faca
      se x > 7 entao
         escreval("     CODIGO:",cod[x],"     NOME:",des[x],"     PREÇO  -  US$--",prec[x]:7:2,"     PREÇO  -  RS$--",prec[x]*cot:7:2)
      fimse
   fimpara
   escreval
   escreval("Pressione ENTER para retornar ao menu")
   leia(parada)
fimprocedimento

//==============================================================================

Procedimento menu
var
   op:inteiro
inicio
   REPITA
      limpatela
      escreval("        ------------------------------------  ")
      escreval("        -           M E N U                -  ")
      escreval("        ------------------------------------  ")
      escreval
      escreval("             1)Cotação do dolar               ")
      escreval("             2)Importar arquivo texto         ")
      escreval("             3)Classificar dados por codigo   ")
      escreval("             4)Classificar dados por descrição")
      escreval("             5)Pesquisar por descrição        ")
      escreval("             6)Pesquisar por codigo           ")
      escreval("             7)MOSTRAR TUDO                   ")
      ESCREVAL("             8) FIM                           ")
      escreval
      escreva ("opção: ")
      SE (OP > 8)  ou (OP < 0) entao
         limpatela
         escreval(" DIGITO INCORRETO, POR FAVOR TENTE DE NOVO!!")
         escreval
         escreval("Precione ENTER para voltar ao menu ")
      FIMSE
      leia(op)
      ESCOLHA op

      CASO 1
         limpatela
         escreva("Qual é a cotação do dolar hoje? ")
         leia(cot)

      CASO 2
         ler_arquivo
      CASO 3
         QuickSortCodigo(1, 939)
      caso 4
         QuickSortDes(1, 939)
      caso 5
         pesquisa_nome
      caso 6
         pesquisa_porcodigo
      caso 7
         mostra_tudo
      FIMESCOLHA
   ATE (op=8)
fimprocedimento

//==============================================================================

Inicio

   tot:=946
   menu



Fimalgoritmo

