################################################################ 
#  Ben Lufuta
#  Project1: Bin-O-Bucks
#  Date: 10/16/2023
##################################################
	.include "macros.asm" # Include the macro file

        .data
        
# Data lables
Greeting:    	.asciiz    "Greetings! I'm your robot bank teller.\n" # ascii string for greeting
PromptInput:    .asciiz    "How many powers-of-two dollars do you want? " # ascii string for prompting
DisplayAmount:    	.asciiz    "\nYou enterred ==> " # ascii string to show the amount enterred
newTab:      	.asciiz    "\n"
Change:  	.asciiz    "\nTotal change ==> " # overall change
PrintChange: 	.asciiz    "Here are your $" # ascii string to show the amount enterred in changes
PrintChanges: 	.asciiz    " Bin-O-Bucks:\n" # ascii string to print the expected output
PrintAllBills: 	.asciiz    "Change Difference ==> " # ascii string to print the expected output

s1024:  .asciiz    " 1024 dollar bill\n"
s512:   .asciiz    " 512 dollar bill\n" 
s256:   .asciiz    " 256 dollar bill\n" 
s128:   .asciiz    " 128 dollar bill\n" 
s64:    .asciiz    " 64 dollar bill\n" 
s32:    .asciiz    " 32 dollar bill\n" 
s16:    .asciiz    " 16 dollar bill\n" 
s8:     .asciiz    " 8 dollar bill\n" 
s4:     .asciiz    " 4 dollar bill\n" 
s2:     .asciiz    " 2 dollar bill\n" 
s1:     .asciiz    " 1 dollar bill\n"

Dollars:  .word    # Entered dollar amount
Bills:    .word    # Bill denominations

        .text # Text segment

main:    # beginning of the code/start of main method

        printString(Greeting)  # Display Greeting to the user
        printString(PromptInput) # Prompt user for input
       # printString(newTab)
        readInt             # receive the input from the user
        move    $s0,    $v0         # save the value received from the user
       # printString(DisplayAmount) # print the amount entered in dollars
       # printInt($s0)
       # printString(newTab) # new tab created

	# check to see if the $1024 bill is part of the change
        li    $s1, 1024 # load register with bill 1024
                        
        div    $s0, $s1 # Find if 1024 bill part of the change from
                        # number entered. mflo = 1 yes mflo = 0 no
                        # mflh gives the remiander

        mflo    $s3    # store the end result of the entered number divided by 1024

        sll    $s2, $s3,    10    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2    	     # $s7 stores the 1024 bill if it exists

        # check to see if the $512 bill is part of the change
        mfhi    $s3            # save the remainder of the previous calculation
        srl    $s1, $s1,  1  
        div    $s3, $s1         # Find if 512 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # keep the quotion of the change/512
        sll    $s2, $s3,    9    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2     # $s7 stores the 512 bill if it exists  
        
        # check to see if the $256 bill is part of the change
        mfhi    $s3             # save the remainder of the previous calculation
        srl    $s1, $s1,    1    
        div    $s3, $s1         # Find if 256 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                       	 	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/256
        sll    $s2, $s3,    8    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2    # $s7 stores the 512 bill if it exists 
        
        # check to see if the $128 bill is part of the change
        mfhi    $s3             # save the remainder of the previous calculation
        srl    $s1, $s1,    1    
        div    $s3, $s1         # Find if 128 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/128
        sll    $s2, $s3,    7    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2    # $s7 stores the 128 bill if it exists
                        
        # check to see if the $64 bill is part of the change
        mfhi    $s3            # save the remainder of the previous calculation
        srl    $s1, $s1,    1   
        div    $s3, $s1         # Find if 64 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/64
        sll    $s2, $s3,    6    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2    # $s7 stores the 64 bill if it exists
        
        # check to see if the $32 bill is part of the change
        mfhi    $s3           # save the remainder of the previous calculation
        srl    $s1,    $s1,    1   
        div    $s3, $s1         # Find if 32 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/32
        sll    $s2, $s3,    5    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2     # $s7 stores the 32 bill if it exists
                       
                        
        # check to see if the $16 bill is part of the change
        mfhi    $s3           # save the remainder of the previous calculation
        srl    $s1, $s1,    1   
        div    $s3, $s1         # Find if 16 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/16
        sll    $s2, $s3,    4    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2     # $s7 stores the 16 bill if it exists
                        
                        
        # check to see if the $8 bill is part of the change
        mfhi    $s3           # save the remainder of the previous calculation
        srl    $s1, $s1,    1   
        div    $s3, $s1         # Find if 8 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/8
        sll    $s2, $s3,    3    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2     # $s7 stores the 8 bill if it exists
        
       # check to see if the $4 bill is part of the change
       mfhi    $s3           # save the remainder of the previous calculation
        srl    $s1, $s1,    1   
        div    $s3, $s1         # Find if 4 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/4
        sll    $s2, $s3,    2    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2     # $s7 stores the 4 bill if it exists
                        
                        
        # check to see if the $2 bill is part of the change
       mfhi    $s3           # save the remainder of the previous calculation
        srl    $s1, $s1,    1   
        div    $s3, $s1         # Find if 2 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/2
        sll    $s2, $s3,    1    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2     # $s7 stores the 2 bill if it exists
        
        # check to see if the $1 bill is part of the change
       mfhi    $s3           # save the remainder of the previous calculation
        srl    $s1, $s1,    1   
        div    $s3, $s1         # Find if 1 bill part of the change from
                        	# number entered. mflo = 1 yes mflo = 0 no
                        	# mflh is the amount of change remaining
        mflo    $s3             # Store the result of remainder/2
        sll    $s2, $s3,    0    # shift to the left and get the necessary bits
        or    $s7, $s7, $s2     # $s7 stores the 1 bill if it exists
        
        
        # Print changes calculated
        printString(PrintChange)
        printInt($s7)
        printString(PrintChanges)

        
        move    $s4,    $s7 # move the contents of $s7 into the new register $s4.
                        
        # check for $1024 bill
        and    $s5,    $s4, 1024   #check for $1024 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10     # move to the next bit (1)

        # Print $1024 result
        printInt($s5) 
        printString(s1024)
        
        # check for $512 bill
        mul    $s4,    $s4, 2   # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $512 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10    # move to the next bit (1)

        # Print $512 result
        printInt($s5) 
        printString(s512)
        
        # check for $256 bill
        mul    $s4,    $s4, 2   # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $256 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10    # move to the next bit (1)

        # Print $256 result
        printInt($s5) 
        printString(s256)
        
        # check for $128 bill
        mul    $s4,    $s4, 2   # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $128 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10    # move to the next bit (1)

        # Print $128 result
        printInt($s5) 
        printString(s128)
        
        # check for $64 bill
        mul    $s4,    $s4, 2    # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $64 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10    # move to the next bit (1)

        # Print $64 result
        printInt($s5) 
        printString(s64)
        
        # check for $32 bill
        mul    $s4,    $s4, 2   # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $32 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10    # move to the next bit (1)

        # Print $32 result
        printInt($s5) 
        printString(s32)
        
        # check for $16 bill
        mul    $s4,    $s4, 2    # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $16 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10    # move to the next bit (1)

        # Print $16 result
        printInt($s5) 
        printString(s16)
        
        
        # check for $8 bill
        mul    $s4,    $s4, 2   # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $8 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10    # move to the next bit (1)

        # Print $8 bill result
        printInt($s5) 
        printString(s8)
        
        
        # check for $4 bill
        mul    $s4,    $s4, 2   # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $4 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl $s5,    $s5,    10    # move to the next bit (1)

        # Print $4 bill result
        printInt($s5) 
        printString(s4)
        
        
        # check for $2 bill
        mul    $s4, $s4, 2    # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $2 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl    $s5, $s5,    10    # move to the next bit (1)

        # Print $2 bill result
        printInt($s5) 
        printString(s2)
        
        
        # check for $1 bill
        mul    $s4, $s4, 2    # compute the product of $s4 and 2, and then store back in $s4.
        and    $s5, $s4,    1024  #check for $1 bill. If $s5 = 1 then it is yes otherwishe it is no
        srl    $s5, $s5,    10    # move to the next bit (1)

        # Print $2 bill result
        printInt($s5) 
        printString(s1)          
                                            
                   
                     
