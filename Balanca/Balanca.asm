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
PLACE 3000H
Tabela: ; 10 / 1 / 2 
      ; 0123456789 ,A , B  , C , D , E,  F
STRING "   UVAS   ",32, 100, 32, 05,32, 34 ; 5.34
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

PLACE 3150H
;MENUS 7 X 16


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
    JEQ GuardaRegistos
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
    MOVB R1, [R0]                   ; R1 guarda o valor do peso
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
    CMP R3, 1
    JNE CicloOpcaoProduto 
    MOV R2, MenuProdutos       
    CALL MostraDisplay
    MOV R0, SEL_NR_MENU
CicloOpcaoProduto:
    MOVB R5, [R0]                   ; R5 guarda o valor da Opcao
    CMP R5, 0
    JEQ CicloOpcaoProduto
    MOV R0, OK                      
    MOVB R3, [R0]                   ; R3 Guarda o valor do OK
    CMP R3, 1
    JNE CicloOpcaoProduto

OpcaoProduto:
    MOV R0, Tabela





; PARA FAZER

Tabela: ; Nome  /  Codigo / PrecoKilo
        ; MAX 9 /    1    /    2      PALAVRAS
AtualizaDisplay: ;Peso == 0

FuncaoReset:
GuardaRegistos:

LimpaDisplay:
LimpaPerifericos:
MostraDisplay:

MenuPrincipal ;(Strings)
MenuBalanca   ;(Strings)
MenuProdutos  ;(Strings)