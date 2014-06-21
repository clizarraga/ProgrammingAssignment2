## @Author: Cesar Lizarraga
## Date: 2014-06-21
## This script provides two functions: 
## 1.- makeCacheMatrix => Creates a "special matrix" with methods and variables to optimize the inverse calculation
## 2.- cacheSolve => Calculates the inverse of a matrix

## Description: 	This method takes a normal matrix and provides methods to manage its values and the inverse variable
## Parameters: 		A numeric Matrix (Can be specified or not)
## Return Value:	List
## Pre-condition: 	The Matrix passed must be invertible (Assumed)
makeCacheMatrix <- function( x = matrix() ) 
{
	# Since its assumed that the X Matrix is invertible, no validations need to be made
	# This variable stores the value of the inverse, init as NULL
  	invVar <- NULL
  	# Setter Method to store the given matrix and reset to NULL the value of invVar
  	setMatrix <- function( matrixTmp )
  	{
  		#Saves matrix in the x variable from the upper environment
	    x <<- matrixTmp
	    #Resets the inverse of the invVar variable from the upper environment
	    invVar <<- NULL
  	}
  	# Setter method to save the value specified to the invVar variable
  	setInverse <- function( newInv ) invVar <<- newInv
  	# Getter Method to retrieve the matrix
  	getMatrix <- function() x
  	# Getter method to retrieve the value of the invVar variable
  	getInverse <- function() invVar
  	# Constructing the list to be returned containing the methods to operate this function 
  	list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}

## Description: 	Calculates the inverse, If its already calculated returns the value, in other case makes the operation and saves it for future references
## Parameters: 		A special matrix created in the previous method
## Return Value:	List
## Pre-condition: 	None
cacheSolve <- function( x, ... ) 
{
	#Retrieves the value of the inverse
	inv <- x$getInverse()
	#Checking if the inverse is already calculated, if so then return the value
	if( !is.null( inv ) )	return( inv )
	#Retrieves the original matrix and his values
	matrixValues <- x$getMatrix()
	#Using the language solve function
	newInv <- solve( matrixValues, ...)
	#Saving its value for future references
	x$setInverse( newInv )
	#Return the calculated inverse value
	newInv
}
