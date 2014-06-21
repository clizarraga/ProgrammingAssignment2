## @Author: Cesar Lizarraga
## Date: 2014-06-21
## This script provides two functions: 
## 1.- makeCacheMatrix => Creates a "special matrix" with methods and variables to optimize the inverse calculation

## Description: 	This method takes a normal matrix and provides methods to manage its values and the inverse variable
## Parameters: 		A numeric Matrix (Can be specified or not)
## Return Value:	List
## Pre-condition: 	The Matrix passed must be invertible (Assumed)
makeCacheMatrix <- function( x = matrix() ) 
{
	# Since its assumed that the X Matrix is invertible, no validations need to be made
	# This variable stores the value of the inverse, init as NULL
  	invVar <- NULL
  	# Setter Method to store the given matrix and reset to NULL the value
  	set <- function( matrixTmp )
  	{
  		#Saves matrix in the x variable from the upper environment
	    x <<- matrixTmp
	    #Resets the inverse of the inv variable from the upper environment
	    invVar <<- NULL
  	}
  	# Setter method to save the value specified to the inv variable
  	setInv <- function( newInv ) invVar <<- newInv
  	# Getter Method to retrieve the matrix
  	get <- function() x
  	# Getter method to retrieve the value of the inv variable
  	getInv <- function() invVar
  	# Constructing the list to be returned containing the methods to operate this function 
  	list(set = set, get = get, setInv = setInv, getInv = getInv)
}


cacheSolve <- function(x, ...) 
{
        ## Return a matrix that is the inverse of 'x'
}
