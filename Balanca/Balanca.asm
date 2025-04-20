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
    MOVB R3, [R0]                   ; R3 Guarda o valor CANCEL
    CMP R3, 1
    JEQ InicioMenu
    MOV R0, PESO
CicloPeso:
    MOV R1, [R0]                    ; R1 guarda o valor do peso
    CMP R1, 1
    CALL AtualizaDisplay
    JL CicloPeso                    ; Se o PESO e menor que o minimo (100g)
    CMP R1, 300
    CALL AtualizaDisplay
    JG CicloPeso                    ; Se o PESO e maior que o maximo (30.000 g)
    CALL AtualizaDisplay            ; Mostra o peso sem produto
    MOV R0, CHANGE
CicloChange:
    MOV 








AtualizaDisplay: ;Peso == 0

FuncaoReset:
GuardaRegistos:

LimpaDisplay:
LimpaPerifericos:
MostraDisplay:

MenuPrincipal ;(Strings)
MenuBalanca   ;(Strings)