; Localização dos perifericos de entrada
ON_OFF      EQU 670H
SEL_NR_MENU EQU 680H
OK          EQU 690H
CHANGE      EQU 6A0H
CANCEL      EQU 6B0H
PESO        EQU 6C0H

; Localização dos periféricos de saída
Display         EQU 600H
Fim_Display     EQU 66FH
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
MensagemErro    EQU 400H

; Localização do banco de registos
BancoRegistos       EQU 4000H
QuantidadeRegistos  EQU 3FF0H

; Configuração da Stack
Place 2000H
    Fim_Stack:
    STACK	200H
    Inicio_Stack:
; Tabela de precos
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
        STRING "TOTAL:          " ; 9 Celulas para por o valor
    MenuGuardaRegistos:                         ; ALTERAR
        STRING " MENU PRINCIPAL "
        STRING "                "
        STRING "1  -  BALANÇA   "
        STRING "2  -  REGISTOS  "
        STRING "----------------"
        STRING "3  -  LIMPA     "
        STRING "      REGISTOS  "
    MenuReset:
        STRING " QUERES APAGAR  "
        STRING " OS REGISTOS ?  "
        STRING " -------------- "
        STRING "1  -  SIM       "
        STRING "2  -  NÃO       "
        STRING "                "
        STRING "                "




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
    
CicloOpcao:
    MOV R0, SEL_NR_MENU
    MOVB R3, [R0]                   ; R3 guarda o valor da Opcao selecionada
    CMP R3, 0
    JEQ CicloOpcao
    MOV R0, OK                      
    MOVB R1, [R0]                   ; R1 guarda o valor do botao OK
    CMP R1, 1
    JNE CicloOpcao

    CMP R3, OBalanca                ; Verificacao da Opcao
    JZ RotinaBalanca
    CMP R3, ORegistos
    JZ OlhaRegistos
    CMP R3, OReset
    JZ PulaReset
    MOV R0, MensagemErro
    MOV R10, 1
    MOV [R0], R10                     ; Erro Opcao
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
    JEQ FIMInicio
    MOV R0, PESO
CicloPeso:
    MOV R1, [R0]                   ; R1 guarda o valor do peso
    CMP R1, 1
    JLT OpcaoExcedida              ; Se o PESO e menor que o minimo (100g)
    MOV R7, R1
    MOV R8, 100
    DIV R7, R8
    CMP R7, 3
    JGT OpcaoExcedida               ; Se o PESO e maior que o maximo (30.000 g)
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
    ADD R2, 6                      ; Endereco do primeiro codigo do produto
    ADD R2, 5
    MOV R0, TabelaMaxima            ; TabelaMaxima igual o tamanho da tabela + 1 (25)
    MOV R7, 0                       ; R7 sera o indice
OpcaoProduto:
    ADD R7, 1                       ; Incrementa indice
    CMP R0, R7                      ; Verifica se chegou no final da tabela
    JLE FimCiclo  
    MOV R6, [R2]                    ; R6 guarda o valor do codigo
    CMP R5, R6                      ; Verifica se achou o produto na tabela
    JEQ CalculaPreco
    MOV R8, 15
    ADD R2, R8                      ; Avanca para o proximo codigo
    JMP OpcaoProduto  
FimCiclo:
    CALL RotinaErro
    JMP CicloChange
CalculaPreco:
    ; R1 Guarda o peso  
    ADD R2, 2                       ; Endereco da parte inteira do valor
    MOVB R6, [R2]                    ; R6 guarda a parte inteira do valor
    MUL R6, R1
    JV ErroOverflow
    ADD R2, 2                       ; Endereco da parte fracionaria do valor
    MOVB R7, [R2]                    ; R7 guarda a parte fracionaria do valor  
    MUL R7, R1
    JV ErroOverflow
    CALL AtualizaDisplay            ; R5 - Produto, R6 - PrecoInteiro, R7 - PrecoFracionario, R1 - PESO
    MOV R2, MenuGuardaRegistos
    CALL MostraDisplay
    CALL LimpaPerifericos
CicloOpcaoRegistos:
    MOV R0, SEL_NR_MENU
    MOV R3, [R0]
    CMP R3, 0
    JEQ CicloOpcaoRegistos
    CMP R3, 1
    JEQ AtalhoGuarda
    CMP R3, 2
    JEQ FIMBalanca
ErroOverflow:
    MOV R0, MensagemErro
    MOV R10, 2
    MOV [R0], R10                     ; Erro Overflow
    CALL RotinaErro
FIMBalanca:
    CALL AtualizaDisplay
    JMP CicloPeso
OpcaoExcedida:
    CALL AtualizaDisplay
    JMP CicloPeso

PulaReset:
    JMP FuncaoReset

FIMInicio:
    JMP InicioMenu
AtalhoGuarda:
    JMP GuardaRegistos
; --------------------------------- ;
; OlhaRegistos ;
; --------------------------------- ;
    OlhaRegistos:
        CALL LimpaPerifericos
        MOV R0, BancoRegistos
        MOV R1, [R0]                    ; R1 guarda o primeiro Registo
        MOV R3, QuantidadeRegistos      ; R3 guarda o endereco da quantidade de registos que possuem
        MOV R2, [R3]                    ; R2 guarda o valor da quantidade de registos
        CMP R2, 0
        JEQ ErroRegistos
        MOV R0, Display
    CicloMostraRegisto:
        CALL LimpaDisplay
        SUB R2, 1
        MOVB [R0], R1                   ; Print do Peso
        ADD R0, 1                   
        ADD R1, 1
        MOVB [R0], R1                   ; Print do valor Total
        CMP R2, 0                       ; Verifica se chegou no final dos registos
        JEQ FimHistorico
        ADD R1, 1                       ; Proximo Registo
        MOV R8, 15
        ADD R0, R8                      ; Proxima Linha 
        JMP CicloMostraRegisto

    FimHistorico:
        MOV R0, CANCEL 
        MOV R1, [R0]                 
        CMP R1, 1
        JEQ FIMInicio
        JMP FimHistorico

    ErroRegistos:
        MOV R0, MensagemErro
        MOV R10, 3
        MOV [R0], R10                      ; Erro Registos 
        CALL RotinaErro
        JMP FIMInicio

    MostraDisplay:
        PUSH R3
        PUSH R0
        PUSH R1
        PUSH R2
        MOV R0, Display
        MOV R1, Fim_Display
    Ciclo_MostraDisplay:
        MOVB R3, [R2]
        MOVB [R0], R3
        ADD R0, 1
        ADD R2, 1
        CMP R0, R1
        JLE Ciclo_MostraDisplay
        POP R2
        POP R1
        POP R0
        POP R3
        RET
    LimpaPerifericos:
        PUSH R0
        PUSH R1
        PUSH R2
        PUSH R3
        PUSH R4
        PUSH R5
        PUSH R6
        MOV R0, ON_OFF
        MOV R1, SEL_NR_MENU
        MOV R2, OK
        MOV R3, CHANGE
        MOV R4, CANCEL
        MOV R5, PESO
        MOV R6, 0
        MOVB [R0], R6 
        MOVB [R1], R6
        MOVB [R2], R6
        MOVB [R3], R6
        MOVB [R4], R6
        MOVB [R5], R6
        POP R6
        POP R5
        POP R4
        POP R3
        POP R2
        POP R1
        POP R0
        RET

    LimpaDisplay:
    PUSH R0
    PUSH R1
    PUSH R2
    MOV R0, Display
    MOV R1, Fim_Display
    MOV R2, CaracterVazio
    Ciclo_LimpaDisplay:
    MOVB [R0], R2; Display(i) = Caracter vazio
    ADD R0, 1
    CMP R0, R1; i = Fim do display?
    JLE Ciclo_LimpaDisplay
    POP R2
    POP R1
    POP R0
    RET





; PARA FAZER

AtualizaDisplay: ;Peso == 0
    ; R1 - PESO, 
    JMP FIMInicio
FuncaoReset:
    MOV R2, MenuReset
    CALL LimpaPerifericos
    CALL MostraDisplay
    MOV R0, OK
    MOV R1, [R0]
    CMP R1, 0
    JZ FIMInicio
CicloReset:
    MOV R2, QuantidadeRegistos  ; R2 guarda o endereco da quantidade de registos
    MOV R1, [R2]                ; R1 guarda a quantidade de registos
    MOV R4, 0
    CMP R1, R4
    JZ FIMInicio              
    MOV R0, BancoRegistos       ; R0 guarda o endereco do banco de registos
    MOV [R0], R4                ; Poe a zero o primeiro registo
    ADD R0, 2                   ; Vai ao proximo registo
    SUB R1, 1                   ; Decrementa a quantidade de registos
    MOV [R2], R1
    JMP CicloReset


GuardaRegistos: ;R5 - Produto, R6 - PrecoInteiro, R7 - PrecoFracionario, R1 - PESO
    MOV R10, QuantidadeRegistos ; R10 guarda o endereco da quantidade de registos 
    MOV R3, [R10]               ; R3 guarda a quantidade de registos
    MOV R0, BancoRegistos       ; R0 guarda o endereco do banco de registos
    SHL R3, 2                   ; R3 ← R3 * 4
    ADD R3, [R10]               ; R3 ← R3 + quantidade → total = quantidade * 5                   
    ADD R0, R3                  ; Vai a posicao livre ddo banco de registo
    ; Guardar os dados
    MOVB [R0], R5               ; Produto
    ADD R0, 2
    MOVB [R0], R1               ; Peso
    ADD R0, 2
    MOVB [R0], R6               ; Parte inteira do preço
    ADD R0, 2
    MOV R9, 46                  ; Caractere de vírgula
    MOVB [R0], R9
    ADD R0, 2
    MOVB [R0], R7               ; Parte fracionária do preço
    MOV R3, [R10]               ; Voltar a buscar quantidade
    ADD R3, 1
    MOV [R10], R3
    JMP FIMBalanca

RotinaErro:
    JMP FIMInicio
