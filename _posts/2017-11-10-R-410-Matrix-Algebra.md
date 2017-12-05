---
layout:
title: Matrix Algebra
date: 2017-11-10  
category:
- R for Beginners
tag: [R]    
author: hkim  
---

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/advstats/matrix.html](https://www.statmethods.net/advstats/matrix.html)

# Matrix Algebra

Most of the methods on this website actually describe the programming of matrices. It is built deeply into the R language. This section will simply cover operators and functions specifically suited to linear algebra. Before proceeding you many want to review the sections on Data Types and Operators.

## Matrix facilites

In the following examples, A and B are matrices and x and b are a vectors.

Operator or Function | Description
-------------------|-----------------------------
`A * B`          | Element-wise multiplication
`A %*% B`        | Matrix multiplication
`A %o% B`        | Outer product. AB'
`crossprod(A,B)` | A'B and A'A respectively.
`crossprod(A)`   | -
`t(A)`           | Transpose
`diag(x)`        | Creates diagonal matrix with elements of x in the principal diagonal
`diag(A)`        | Returns a vector containing the elements of the principal diagonal
`diag(k)`        | If k is a scalar, this creates a k x k identity matrix. Go figure.
`solve(A, b)`	   | Returns vector x in the equation b = Ax (i.e., A-1b)
`solve(A)`       | Inverse of A where A is a square matrix.
`ginv(A)`        | Moore-Penrose Generalized Inverse of A.
-                | ginv(A) requires loading the MASS package.
`y<-eigen(A)`    | y$val are the eigenvalues of A
-                | y$vec are the eigenvectors of A
`y<-svd(A)`      | Single value decomposition of A.
-                | y$d = vector containing the singular values of A
-                | y$u = matrix with columns contain the left singular vectors of A
-                | y$v = matrix with columns contain the right singular vectors of A
`R <- chol(A)`   | Choleski factorization of A. Returns the upper triangular factor, such that R'R = A.
`y <- qr(A)`     | QR decomposition of A.
-                | y$qr has an upper triangle that contains the decomposition and a lower triangle that contains information on the Q decomposition.
-                | y$rank is the rank of A.
-                | y$qraux a vector which contains additional information on Q.
-                | y$pivot contains information on the pivoting strategy used.
`cbind(A,B,...)` | Combine matrices(vectors) horizontally. Returns a matrix.
`rbind(A,B,...)` | Combine matrices(vectors) vertically. Returns a matrix.
`rowMeans(A)`    | Returns vector of row means.
`rowSums(A)`     | Returns vector of row sums.
`colMeans(A)`    | Returns vector of column means.
`colSums(A)`     | Returns vector of column sums.


## Matlab Emulation

The matlab package contains wrapper functions and variables used to replicate MATLAB function calls as best possible. This can help porting MATLAB applications and code to R.

## Going Further

The Matrix package contains functions that extend R to support highly dense or sparse matrices. It provides efficient access to BLAS (Basic Linear Algebra Subroutines), Lapack (dense matrix), TAUCS (sparse matrix) and UMFPACK (sparse matrix) routines.


## To Practice

Try some of the exercises in matrix algebra in this course on intro to statistics with R.
