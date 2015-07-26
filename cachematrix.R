install.packages("R.cache", dependencies=TRUE)

makeCacheMatrix <- function(x = matrix()) { # creating the matrix X
  inv <- NULL # we state the inverse of the matrix to be empty
  set <- function(y) { # set a new function within the matrix
    x <<- y # we assign the value of y to x if it is not previously set
    inv <<- NULL # we assign the value null to inverse if it is not previously taken
  }
  get <- function() x #
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}

x <- rbind(c(2, 3), c(2, 2))
solve(x)
m = makeCacheMatrix(x)
m$get()

cacheSolve(m)









