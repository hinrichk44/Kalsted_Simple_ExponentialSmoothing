#Exponential Smoothing With ETS
#Downloading the forecast library to obtain ets function
library(forecast)
#Applying ets to the nottem dataset
#The dataset consists of 20 years of monthly temperature measurements at 
#Notthingham Castle
etsnottem = ets(nottem)
etsnottem
#We have ETS(A,N,A) meaning we have additive error, non-present trend, and
#additive seasonality 
#Both of the smooting parameters are close to 0, indicating smoothness
#Here we are plotting the nottem set with the fitted model
plot(nottem, lwd = 3)
lines(etsnottem$fitted, col = 'red')
#The fitted values are quite close to the original dataset
#Now we are plotting the forecast
#We are using 12 for 12 months to add a full year to the cycle
plot(forecast(etsnottem, h = 12))
#We can also manually set the ets model, this time using multiplicative
nottemmulti = ets(nottem, model = "MZM")
nottemmulti
#Here we are plotting the multiplicative model vs. the original dataset
plot(nottem, lwd = 3)
lines(nottemmulti$fitted, col = 'red')
#This new model does not catch the peaks as well