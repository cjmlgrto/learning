        .data
str:    .asciiz "Hello world!"
        
        .text
la      $a0, str
addi    $v0, $0, 4
syscall
addi    $v0, $0, 10
syscall