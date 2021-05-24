#Exercise 4b:
#charge vs pH plot:

#A simple and easy method with vectors:

#create a vector of pH values, from 0 to 14, every 0.01 pH unitcs
pH <- seq(0, 14, 0.01)

#create a vector to store charge values, the same length as pH and fill it with 0s
charge <- rep(0, length(pH))

#for every value in the pH vector, calculate the charge for the peptide DIAK, and store the value in the charge vector
for (i in 1:length(pH)){
  charge[i] <- pep_charge("DIAK", pH = pH[i])
}

#plot the pH and charge, 
plot(pH, charge, xlab = 'pH', ylab = 'Charge')




#A slightly more involved method with dataframes and ggplot2
my_peptide <- 'DIAK'

#create dataframe to store peptide charge information
#create list of pH from 0 to 14, every 0.01 pH unit.
#create a column for charge and set it to 0
pH_df <- data.frame(pH = seq(from = 0, to = 14, by = 0.01),
                    charge = 0)

#for each row in the df, use the pep_charge() function to calculate charge
for (i in 1:nrow(pH_df)){
  pH_df$charge[i] <- pep_charge(my_peptide, pH = pH_df$pH[i])
}

#plot the resulting charge trace over all the pH values
plot(pH_df$pH, pH_df$charge, xlab = "pH", ylab = "Charge")

#or for those familiar with ggplot2 (This can be customized in many different ways)
library('ggplot2')
ggplot(data = pH_df) +
  geom_point(aes(x = pH, y = charge), color = 'red') +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 7) +
  theme_bw(base_size = 25) +
  scale_x_continuous(breaks = c(0:14))
