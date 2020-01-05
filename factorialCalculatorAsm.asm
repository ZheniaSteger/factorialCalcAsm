# Zhenia Steger
# Factorial Calculator
# Cal State San Marcos

.data
str: .asciiz "Factorial Calculator!\n"
str2: .asciiz "Enter a number (between 0 and 10):"
newline: "\n"
space: " "
str3: "Running Fact() Subroutine...\n"
str4: "Number is out of range, please enter 0<N<10.\n"
str5: "The result is: "
.text

# Start of main code
main:
li $s0, 10	# For comparison <10
# Print Strings
li $v0, 4
la $a0, str
syscall
la $a0, str2
syscall
la $a0, space
syscall
li $v0, 5
syscall
# Number to $t0 register
add $t0, $v0, $0
# Determines if number is in range
bgt $t0, $s0, done2
beqz $t0, done2
bltz $t0, done2

# Tells when entering the subroutine
li $v0, 4
la $a0, str3
syscall

add $t1, $t0, $0
subi $t2, $t0, 1

jal Factorial

Factorial: beqz $t2, doneRight
mult $t1, $t2
mflo $t1
subi $t2, $t2, 1
j Factorial

# Exits printing the correct result
doneRight:
li $v0, 4
la $a0, str5
syscall
add $a0, $t1, $0
li $v0, 1
syscall
li $v0, 10
syscall

# Error message when the number is out of range
done2:
li $v0, 4
la $a0, str4
syscall
j main
