# Blood-Donation-Drivendata
Warm Up: Predict Blood Donations (Competition: Hosted By DrivenData) 
This is a data science based competion hosted by https://www.drivendata.org

Key Points:
 
  1. Data Cleaning: This project needed a good amount of data pre-processing. Firstly, the amount of blood donation feature was removed
  because of singularity. This was tested using a simple linear model.
  
  2. Feature Engineering: A new feature "blood donation frequency" was added using three other features.
  3. Normalisation: Train & test dataset were scaled.
  4. Modeling: Here, random forest model has been used with ntree = 200, and type = probability
  
  
However, no cross validation was done. So, for better results cross validation could be beneficial.
This approach provided me with log loss of 0.4435 and took me to 181 out of 2600 competitors. So,
I'm quite happy with this result. You can also used logistic regression method / SVM regression to
calculate probability. That could give good results too. Best of luck!

My Drivendata Account: https://www.drivendata.org/users/nouroz/
  
  
