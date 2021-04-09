#Exercise 4c:
#pI calculator:

#There are many ways to do this. Here is one option

#create a function to determine peptide pI
#confidence is how close the charge must be to 0 before the pI is estimated
pep_pI <- function(peptide, confidence = 0.0001) {
  #set the counter to 1. Keeps track of the number of iterations
  counter = 1
  #start at pH 7
  pH <- 7
  #start at a very high charge, this will be updated each iteration.
  #the 'goal' is to get the charge as close to 0 as possible
  charge = 100
  
  #continue looping while the absolute value of the charge is greater than the confidence limit set
  while (abs(charge) >= confidence) {
    #calculate the charge at a given pH. Starts at 7.
    #if the charge is positive, try a new pH higher than the old one
    #if the charge is negative, try a new pH lower than the old one.
    #each time, divide the search space in half
    charge <- pep_charge(peptide, pH = pH)
    if (charge >= 0) {
      pH <- pH + (7/(2^counter))
    } else {
      pH <- pH - (7/(2^counter))
    }
    
    #increase the counter by one because another iteration has been performed
    counter = counter + 1
  }
  
  #print results. These lines can be commented in if printing is desired. Rounds to 3 decimal places
  #the iterations is 'counter - 1', because the counter starts at 1.
  #print(paste0('pI is : ', round(pH, 3)))
  #print(paste0('Converged in: ', (counter - 1), ' iterations'))
  
  #return the pH at charge ~0, which is the pI
  return(pH)
}