## This code consists of 2 functions which create a "special" matrix and calculate it's inverse 

## makeCacheMatrix function set the enviroment for creating our special matrix as it consists of inner 4 
## functions that are responsible for setting and getting the matrix and it's inverse 

makeCacheMatrix <- function(x = matrix()) {
  inverseMatrix <- x # inverse matrix variable 
  # set the matrix 
  setMatrix <- function(mat){
    inverseMatrix <<- matrix()
    x <<- mat
  }
  # return the matrix
  getMatrix <- function(){
    x
  }
  # set inverse matrix 
  setInverse <- function(){
    inverseMatrix <<- solve(x)
  }
  # return inverse matrix
  getInverse <- function(){
    inverseMatrix
  }
  list(setMatrix = setMatrix , getMatrix = getMatrix , setInverse = setInverse , getInverse = getInverse)
}


## responsible for checking the caching of the result and if not return the inverse of a given matrix x 

cacheSolve <- function(x, ...) {
  # getting inverse variable 
  inverseMatrix <- x$getInverse()
  
  if(!is.null(inverseMatrix)) {
    
    message("getting cached matrix")
    return(inverseMatrix)
  
  }
  # getting the original matrix which we need to calculate it's inverse
  originalMatrix <- x$getMatrix()
  # calculate inverse matrix 
  inverseMatrix <- solve(originalMatrix)
  x$setInverse(inverseMatrix)
  # return the result
  inverseMatrix
  
}
