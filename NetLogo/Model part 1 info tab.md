## WHAT IS IT?

This model explores the growth of algae and the production of lipids for the eventual creation of green crude and/or biofuels based on certain environmental. The default option upon opening is to model for biomass growth, and has an option where you can change it to model lipid production.

## HOW IT WORKS

There are two variations in the model:

The first option, as mentioned before, models the accumulation of biomass in a raceway pond with a size 3.5 m by 1.5 m and 35 cm in depth (1025 L nominal volume at 25 cm working depth, with a surface area of 4.2 m<sup>2</sup> including the paddlewheel area), with a variety of factors that can be influenced by the user, with the algae strain being  KA32 - _Nannochloropsis Oceanica_ – Cellana, or LRB-AZ-1201 - _Chlorella Vulgaris_ - Arizona State University.

The second option, also mentioned earlier, models the accumulation of lipids in algae based off of lab data during three phases of algae cultivation, Repletion, Starvation, and Resupplementation, and is less representative of a full scale solution, because the data used to produce this part of the model came from a laboratory testing. The algal strain used is _Chlamydomonas reinhardtii_ CC-1690. 

Both options in the model uses a combination of custom code and NetLogo’s Systems Dynamics Modeler.


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

   - Average Temperature and Standard Deviation of Temperature for each season, listed as [Season]_mean_temp and [Season]_temp_STDEV, respectively, used to generate the temperature of the pond throughout the cycle.

   - Mean_Sal, and Sal_STDEV, the mean salinity and standard deviation of salinity for the pond, to generate the salinity of the pond throughout the cycle.

   - user-mg/L-Nitrogen, how much nitrogen is added to the pond at the beginning of the cultivation.

   - Harvest point, the point at when algae is harvested, in percent of maximum biomass, where 0 is 0% and 1 is 100%.

If Starve for Lipid Production is **ON**, set the following values:

    - Ressuplement Nitrogen Amount, the among of nitrogen in mg/L added after the starvation period is over

    - Starvation Start trigger, which allows you to choose how the start of starvation is triggered. **OPTIONS**: Time, Biomass, Remaining Nitrogen

		- For Starvation Start, if you choose Time as the trigger, set the number of Ticks/Hours after cultivation starts for the starvation period to start.

		- If you choose Biomass as your trigger, set starvation start to the amount of biomass in mg that you want there to be before starvation starts.

		- If you choose Remaining Nitrogen, it is a bit more complicated; the number you choose for Starvation start has to be below user-mg/L-Nitrogen, and is the amount of nitrogen you want left in the model before the algae is washed and starved.

	- Starvation Length is the amount of Time, Hours/Ticks, that the Starvation Period lasts for


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