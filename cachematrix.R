## Put comments here that give an overall description of what your
## functions do

## 19-01-2015 Mahmut Ali ÖZKURAN
## Coursera R Porgramming Programming Assignment

## makeCacheMatrix pratically a class of object written in R which holds inverse of given matrix
## getter and setter methods available 
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL    # setting m NULL 
    set <- function(y) {        # setter method 
      x <<- y                   # set y to x
      m <<- NULL                # if no assigned matrix m set NULL
    }
    get <- function() x         # getter method
    setinverse <- function(inverse) m <<- inverse      # setinverse function
    getinverse <- function() m                         # getinverse function
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)      # list of available functions implemented
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()        # getting inverse of given matrix using makeCacheMatrix
    if(!is.null(m)) {          # check if inverse is null
      message("getting cached data")  
      return(m)                # returns inverse matrix
    } 
    data <- x$get()            # if matrix not cached start inversing
    m <- solve(data, ...)      # inverse using solve()
    x$setinverse(m)            # cache inversed matrix
    m                          # return inverse
}
