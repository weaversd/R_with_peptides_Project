#Exercise 4a:
#summary function:

peptide_summary <- function(peptide, pH){
  
  print(paste0('Peptide is: ', peptide))
  print(paste0('charge at pH ', pH, ' is: ', pep_charge(peptide, pH)))
  print(paste0('Mass is: ', pep_mass(peptide)))
  
  #using the original m/z function
  print(paste0('m/z at pH ', pH, ' is: ', m_over_z(peptide, pH)))
  
  #if the charge is +1, and we add the mass of a proton, m/z is just mass + 1.008
  print(paste0('Expected m/z for MALDI is ', (1.008 + pep_mass(peptide))))
  
}