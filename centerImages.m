%Step 2 - Making the centered matrix 

function[A,mu] = centerImages(X)

mu = mean(X,2);
A = X-mu;

end 
