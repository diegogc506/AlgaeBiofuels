## WHAT IS IT?

This model explores the growth of algae and the production of lipids for the eventual creation of green crude and/or biofuels based on certain environmental factors. 
The default option upon opening is to model for biomass growth, and has an option where you can change it to model lipid production.

## HOW IT WORKS
 
 
 The model models the accumulation of biomass in a raceway pond with a size 3.5 m by 1.5 m and 35 cm in depth (1025 L nominal volume at 25 cm working depth, with a surface area of 4.2 m<sup>2</sup> including the paddlewheel area), with a variety of factors that can be influenced by the user, with the algae strain being  KA32 - _Nannochloropsis_ _Oceanica_ – Cellana, or LRB-AZ-1201 - _Chlorella_ _Vulgaris_ - Arizona State University.




## HOW TO USE IT

 Two main buttons are used to control the model:

SETUP: Run this once you have set all the settings as described below, it resets all backend code and clears outputs. **BEFORE YOU RUN THIS, MAKE SURE TO SAVE ANY GRAPHS YOU WANT.**

START: Use this to run the model simulation. **MAKE SURE TO RUN SETUP FIRST**, or the model will not run at all, as non-first attempts may function improperly on first run.

There are many inputs you can choose to manipulate:

 	- Starve for Lipid Production is the most important one.

If **OFF** set the following values as you see fit, or leave to their defaults:

   - **The most important of these** is Strain.

   	- If set to  KA32 - Nannochloropsis Oceanica, the model will use corelation data for KA32, the main data points in the raceway dataset used.

   	- If set to LRB-AZ-1201 - Chlorella Vulgaris, the model will use correlation data for LRB-AZ-1201, the secondary set of data points in the raceway dataset used.

   - Salinity, used to set the salinity of the pond for the entire run
	- assumed to stay close to constant during the cultivation run, and as such, changeing this variable during the run will have no effect, as it it is set to a hidden constant at the beginning of each run, and will not change unless the **_Setup_** command is run

   - user-mg/L-Nitrogen, how much nitrogen is added to the pond at the beginning of the cultivation.

   - Harvest point, the point at when algae is harvested, in percent of maximum biomass, where 0 is 0% and 1 is 100%.


## THINGS TO NOTICE

- Think about if the output make sense, for example, when nitrogen is lower, lipids should be higher. If you do not see that, why?
- Think about what should have an effect. Do some research, does what you find online match with what you see, why or why not?
- What causes the pond to crash/stop working?

## THINGS TO TRY

- Try moving sliders to extremes
- Try setting all values close to each other
- Try to cause a quick pond crash

## EXTENDING THE MODEL

- There are some extra lines of code, to make a list of values that can be exported at the end of the run with some code, make it to get values out
- Figure out how to plot other variables, and plot ones that you think might be important

## NETLOGO FEATURES

- The model uses large and stacked IF queries
- The model relies heavily on stocks and Systems Dynamics


## CREDITS AND REFERENCES

[Raceway Pond Model](https://www.kaggle.com/stargarden/the-algae-testbed-publicprivate-partnership-atp3) From [Kaggle](https://www.kaggle.com/)/[OpenEI](https://openei.org/wiki/ATP3_Data)/[NREL](https://data.nrel.gov/)
[Kaggle Data Set was originally on NREL](https://data.nrel.gov/submissions/76) 
[Lipid Starvation Model](https://baliga.systemsbiology.net/projects/green-algae-biofuels/): [Institute of Systems Biology](https://isbscience.org/) Data on How Different Nutrients Effect Lipid Production