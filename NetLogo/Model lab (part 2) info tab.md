## WHAT IS IT?

This model explores the growth of algae and the production of lipids for the eventual creation of green crude and/or biofuels based on certain environmental factors. 

## HOW IT WORKS

This model models the accumulation of lipids in algae based off of lab data during three phases of algae cultivation, Repletion, Starvation, and Resupplementation, and is less representative of a full scale solution, because the data used to produce this part of the model came from a laboratory testing. The algal strain used is _Chlamydomonas_ _reinhardtii_ CC-1690. 



## HOW TO USE IT

 Two main buttons are used to control the model:

**_SETUP_**: Run this once you have set all the settings as described below, it resets all backend code and clears outputs. **_BEFORE_ _YOU_ _RUN_ _THIS,_ _MAKE SURE_ _TO_ _SAVE_ _ANY_ _GRAPHS_ _YOU_ _WANT_.**

**_START_**: Use this to run the model simulation. **_MAKE_ _SURE_ _TO_ _RUN_ _SETUP_ _FIRST_**, or the model will not run at all, as non-first attempts may function improperly on first run.

There are five inputs you can choose to manipulate:

  - **_Initial-Nitrogen_**, how much nitrogen is added to the pond at the beginning of the cultivation, in mg/L.
   - Nitrogen is consumed at a rate proportional to the level of biomass, starting at the amount chosen by **_Initial-Nitrogen_**, and then at resupplementation by **_Initial-Supplementation-Nitrogen_**.
   
  - **_Initial-Supplementation-Nitrogen_**, the among of nitrogen in mg/L added after the starvation period is over

  - **_Starvation-Trigger_**, which allows you to choose how the start of starvation is triggered. **OPTIONS**: Time and  Biomass

	- For **_Starvation-Trigger-Amount_**, if you choose **Time** as the trigger, set the number of Ticks/Hours after cultivation starts for the starvation period to start.

	- If you choose **Biomass** as your trigger, set **_Starvation-Trigger-Amount_** to the amount of biomass in mg that you want there to be before starvation starts.

  - **_Starvation-Length_** is the amount of _Time_, in _Hours_, that the Starvation Period lasts for


## THINGS TO NOTICE

- Think about if the output make sense, for example, when nitrogen is lower, lipids should be higher. If you do not see that, why?
- Think about what should have an effect. Do some research, does what you find online match with what you see, why or why not?
- What causes the pond to crash/stop working?

## THINGS TO TRY

- Try moving sliders to extremes_
- Try setting all values close to each other
- Try to cause a quick pond crash

## EXTENDING THE MODEL

- Figure out how to plot other variables, and plot ones that you think might be important

## NETLOGO FEATURES

- The model uses large and stacked IF queries
- The model relies heavily on stocks and Systems Dynamics, rewritten by hand from the built in System Dynamics Modeler to allow it to work in NetLogo Web


## CREDITS AND REFERENCES

[Lipid Starvation Model](https://baliga.systemsbiology.net/projects/green-algae-biofuels/): [Institute of Systems Biology](https://isbscience.org/) Data on How Different Nutrients Effect Lipid Production
