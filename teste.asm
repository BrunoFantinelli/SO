[BITS 32]
[ORG 0X7C00]

jmp main

main:
  xor ah, ah ;faz a comparação, caso for igual atribui 0
  int 0x16 ;chamada para leitura de teclado, aguarda a leitura
  mov ah, 0x0e ; Imprimi o caracter na tela
  int 0x10 ;Serviço de video da Bios
  cmp al, 33 ;compara a exclamação
  jne continua ;se falso segue com o fluxo do progama
  mov eax,1 ;chamada de sistema de saida
  int 0x80 ; chamada do kernel


  enter_nao_pressionado:
  jmp main ;volta para o main sem iniciar uma nova linha

  continua:
  cmp al, 0x0d ;compara se foi pressionado a tecla enter
  jne enter_nao_pressionado; se for falso, vai para enter_nao_pressionado
  mov al, 0x0a ;pula de linha
  int 0x10 ;printa a nova linha
  jmp main
times 510 - ($-$$) db 0
dw 0xAA55
