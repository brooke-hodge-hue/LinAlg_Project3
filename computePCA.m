%Part 3 doing the PCA

function[U, S, V, singularValues] = computePCA(A)

%Using the svc to help calculate the eigenvalues and eigenvectors 
[U, S, V] = svd(A, 'econ');

%Now finding the singular values 
singularValues = diag(S);




