; Localização dos perifericos de entrada
ON_OFF      EQU 1A0H
SEL_NR_MENU EQU 1B0H
OK          EQU 1B0H
CHANGE      EQU 1C0H
CANCEL      EQU 1D0H
PESO        EQU 1E0H

; Localização dos periféricos de saída
Display         EQU 200H
FIm_Display     EQU 26FH
CaracterVazio   EQU 20H

; Opções do menu principal
OBalanca    EQU 1
ORegistos   EQU 2
OReset      EQU 3

; Tabela de precos
NomeMaximo      EQU 10
CodigoMaximo    EQU 2
PrecoMaximo     EQU 3
TabelaMaxima    EQU 25
PLACE 3000H
Tabela: ; 10 / 1 / 2 
      ; 0123456789 ,A , B  , C , D , E,  F
    STRING "   UVAS   ",32, 100, 32, 05, 32, 34 ; 5.34
    STRING " MELANCIA ",32, 101, 32, 01, 32, 87
    STRING "  ANANÁS  ",32, 102, 32, 01, 32, 87
    STRING "   KIWI   ",32, 103, 32, 03, 32, 56
    STRING " PÊSSEGO  ",32, 104, 32, 04, 32, 46
    STRING "  BANANA  ",32, 105, 32, 02, 32, 58
    STRING " MORANGO  ",32, 106, 32, 04, 32, 46
    STRING "FRAMBOESA ",32, 107, 32, 17, 32, 81
    STRING " LARANJA  ",32, 108, 32, 01, 32, 60
    STRING "TANGERINA ",32, 109, 32, 02, 32, 22
    STRING " CENOURA  ",32, 110, 32, 01, 32, 04
    STRING "  BATATA  ",32, 111, 32, 01, 32, 14
    STRING "   NABO   ",32, 112, 32, 02, 32, 28
    STRING "BETERRABA ",32, 113, 32, 05, 32, 23
    STRING "   ALHO   ",32, 114, 32, 06, 32, 19
    STRING "  CEBOLA  ",32, 115, 32, 01, 32, 43
    STRING " ERVILHA  ",32, 116, 32, 01, 32, 42
    STRING "LENTILHAS ",32, 117, 32, 02, 32, 19
    STRING "  TRIGOS  ",32, 118, 32, 00, 32, 95
    STRING "  MILHO   ",32, 119, 32, 03, 32, 62
    STRING "  FAVAS   ",32, 120, 32, 04, 32, 07
    STRING "CASTANHAS ",32, 121, 32, 08, 32, 92
    STRING "   NOZ    ",32, 122, 32, 18, 32, 39
    STRING " AMENDOIM ",32, 123, 32, 08, 32, 03 
    STRING "   CAFÉ   ",32, 124, 32, 20, 32, 25

; MENUS 


PLACE 3250H

MenuProdutos:
    STRING "   UVAS   --",32, 100, 32, 32, 32, 32 ; 5.34
    STRING " MELANCIA --",32, 101, 32, 32, 32, 32
    STRING "  ANANÁS  --",32, 102, 32, 32, 32, 32
    STRING "   KIWI   --",32, 103, 32, 32, 32, 32
    STRING " PÊSSEGO  --",32, 104, 32, 32, 32, 32
    STRING "  BANANA  --",32, 105, 32, 32, 32, 32
    STRING " MORANGO  --",32, 106, 32, 32, 32, 32
    STRING "FRAMBOESA --",32, 107, 32, 32, 32, 32
    STRING " LARANJA  --",32, 108, 32, 32, 32, 32
    STRING "TANGERINA --",32, 109, 32, 32, 32, 32
    STRING " CENOURA  --",32, 110, 32, 32, 32, 32
    STRING "  BATATA  --",32, 111, 32, 32, 32, 32
    STRING "   NABO   --",32, 112, 32, 32, 32, 32
    STRING "BETERRABA --",32, 113, 32, 32, 32, 32
    STRING "   ALHO   --",32, 114, 32, 32, 32, 32
    STRING "  CEBOLA  --",32, 115, 32, 32, 32, 32
    STRING " ERVILHA  --",32, 116, 32, 32, 32, 32
    STRING "LENTILHAS --",32, 117, 32, 32, 32, 32
    STRING "  TRIGOS  --",32, 118, 32, 32, 32, 32
    STRING "  MILHO   --",32, 119, 32, 32, 32, 32
    STRING "  FAVAS   --",32, 120, 32, 32, 32, 32
    STRING "CASTANHAS --",32, 121, 32, 32, 32, 32
    STRING "   NOZ    --",32, 122, 32, 32, 32, 32
    STRING " AMENDOIM --",32, 123, 32, 32, 32, 32  
    STRING "   CAFÉ   --",32, 124, 32, 32, 32, 32

MenuPrincipal:
    STRING " MENU PRINCIPAL "
    STRING "                "
    STRING "1  -  BALANÇA   "
    STRING "2  -  REGISTOS  "
    STRING "----------------"
    STRING "3  -  LIMPA     "
    STRING "      REGISTOS  "
MenuBalanca:
    STRING "PRODUTO:        "
    STRING "                "
    STRING "PESO:           "
    STRING "                "
    STRING "PREÇO:          "
    STRING "                "
    STRING "TOTAL: " ; 9 Celulas para por o valor


; Configuração da Stack
Place 2000H
Fim_Stack:
STACK	200H
Inicio_Stack:

; --------------------------------- ;
; Inicio ;
; --------------------------------- ;
Place 0
MOV R0, ProgramaPrincipal
JMP R0


; --------------------------------- ;
; ProgramaPrincipal ;
; --------------------------------- ;
ProgramaPrincipal:
    MOV SP, Inicio_Stack
    CALL LimpaPerifericos
Ciclo_ON_OFF:
    CALL LimpaDisplay
    MOV R0, ON_OFF                  ; Leitura do ON_OFF
    MOVB R1, [R0]
    CMP R0, R1
    CMP R1, 1
    JNE Ciclo_ON_OFF

InicioMenu:
    MOV R2, MenuPrincipal           
    CALL MostraDisplay              ; Mostra o menu principal
    CALL LimpaPerifericos   
    MOV R0, CANCEL
    MOVB R1, [R0]
    CMP R1, 1
    JEQ InicioMenu                  ; Volta o menu se CANCEL for pressionado
    MOV R0, SEL_NR_MENU
CicloOpcao:
    MOVB R3, [R0]                   ; R3 guarda o valor da Opcao selecionada
    CMP R3, 0
    JEQ CicloOpcao
    MOV R0, OK                      
    MOVB R1, [R0]                   ; R1 guarda o valor do botao OK
    CMP R1, 1
    JNE CicloOpcao

    CMP R3, OBalanca                ; Verificacao da Opcao
    JEQ RotinaBalanca
    CMP R3, ORegistos
    JEQ OlhaRegistos
    CMP R3, OReset
    JEQ FuncaoReset
    CALL RotinaErro
    JMP InicioMenu

; --------------------------------- ;
; RotinaBalanca ;
; --------------------------------- ;
RotinaBalanca:
    MOV R2, MenuBalanca
    CALL MostraDisplay
    CALL LimpaPerifericos
    MOV R0, CANCEL                  
    MOVB R4, [R0]                   ; R4 Guarda o valor CANCEL
    CMP R4, 1
    JEQ InicioMenu
    MOV R0, PESO
CicloPeso:
    MOV R1, [R0]                   ; R1 guarda o valor do peso
    CMP R1, 1
    CALL AtualizaDisplay
    JL CicloPeso                    ; Se o PESO e menor que o minimo (100g)
    CMP R1, 300
    CALL AtualizaDisplay
    JG CicloPeso                    ; Se o PESO e maior que o maximo (30.000 g)
    CALL AtualizaDisplay            ; Mostra o peso sem produto
    MOV R0, CHANGE
CicloChange:
    MOVB R3, [R0]                   ; R3 guarda o valor do CHANGE
    MOV R0, SEL_NR_MENU
    CMP R3, 1
    JNE CicloOpcaoProduto 
    MOV R2, MenuProdutos       
    CALL MostraDisplay
    
CicloOpcaoProduto:
    MOVB R5, [R0]                   ; R5 guarda o valor da Opcao
    CMP R5, 0
    JEQ CicloOpcaoProduto
    MOV R0, OK                      
    MOVB R3, [R0]                   ; R3 Guarda o valor do OK
    CMP R3, 1
    JNE CicloOpcaoProduto
    MOV R2, Tabela
    ADD R2, 11                      ; Endereco do primeiro codigo do produto
    MOV R0, TabelaMaxima            ; TabelaMaxima igual o tamanho da tabela + 1 (25)
    MOV R7, 0                       ; R7 sera o indice

OpcaoProduto:
    ADD R7, 1                       ; Incrementa indice
    CMP R0, R7                      ; Verifica se chegou no final da tabela
    JLE FimCiclo  
    MOV R6, [R2]                    ; R6 guarda o valor do codigo
    CMP R5, R6                      ; Verifica se achou o produto na tabela
    JEQ CalculaPreco
    ADD R2, 16                      ; Avanca para o proximo codigo
    JMP OpcaoProduto  
    
FimCiclo:
    CALL RotinaErro
    JMP CicloChange
CalculaPreco:
    ; R1 Guarda o peso  
    ADD R2, 2                       ; Endereco da parte inteira do valor
    MOVB R6, [R2]                    ; R6 guarda a parte inteira do valor
    MUL R6, R1
    JOV ErroOverflow
    ADD R2, 2                       ; Endereco da parte fracionaria do valor
    MOVB R7, [R2]                    ; R7 guarda a parte inteira do valor  
    MUL R7, R1
    JOV ErroOverflow
    CALL AtualizaDisplay            ; R5 - Produto, R6 - PrecoInteiro, R7 - PrecoFracionario, Nome???

    MOV R2, MenuGuardaRegistos
    CALL MostraDisplay
    CALL LimpaPerifericos
CicloOpcaoRegistos:
    MOV R0, SEL_NR_MENU
    MOV R3, [R0]
    CMP R3, 0
    JEQ CicloOpcaoRegistos
    CMP R3, 1
    JEQ GuardaRegistos
    CMP R3, 2
    JEQ FIMBalanca



ErroOverflow:
FIMBalanca:
    CALL AtualizaDisplay
    JMP CicloPeso













; PARA FAZER

ErroOverflow:
AtualizaDisplay: ;Peso == 0
FuncaoReset:
GuardaRegistos:
LimpaDisplay:
LimpaPerifericos:
MostraDisplay:

RotinaErro:
OlhaRegistos: