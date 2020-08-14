globals [has_Starved starving Starving_start_time Starving_end_time Resupplementing lipid_in2 lipid_out model_number lipid_decrease_for]

to Setup
  file-close-all ; Close any files open from last run
  file-open "CSV files/actually_processed_new.csv"
  ca
  system-dynamics-setup
  set has_Starved False
  set starving False
  set Starving_start_time 100000000
  set Starving_end_time 0
  set Resupplementing False
  set lipid_in2 []
  set lipid_out []
  set Resupplement_Lipid_Loss 0
  set Resupplement_Biomass_Growth 0
  set Resupplement_Lipid_Growth 0
end
to Start


  if  Starve_for_Lipid_Production [
    set Max_Lipid 1
    set S-curve 0
    if (((Starvation_Start_Trigger = "Biomass") and (Biomass >= Starvation_start)) and (has_Starved = False)) [
      set has_Starved True
      set starving True
      set Starving_start_time Ticks
      set Starving_end_time ((Starving_start_time)+(Starvation_length))
      set mg/L-Nitrogen 0
      set Biomass_Growth 0
      set Lipid_Growth 0
      set Lipid_Starve_Growth 0
      set Biomass_Starve_Growth 27140.12680685151
   ]
   if (((Starvation_Start_Trigger = "Time") and (Ticks = Starvation_start)) and (has_Starved = False)) [
     set has_Starved True
     set starving True
     set Starving_start_time Ticks
     set Starving_end_time ((Starving_start_time)+(Starvation_length))
     set mg/L-Nitrogen 0
     set Biomass_Growth 0
     set Lipid_Growth 0
     set Lipid_Starve_Growth 0
     set Biomass_Starve_Growth 27140.12680685151
   ]
   if starving [
     set mg/L-Nitrogen 0
     set Biomass_Growth 0
     set Biomass_Starve_Growth 27140.12680685151
     set Lipid_Growth 0
     set Lipid_Starve_Growth ((219.19277649586314)*(1))
     ;room for biomass code
     ;room for biomass code
   ]
   if starving and Ticks = Starving_end_time [
     set starving False
     set Resupplementing True
     set mg/L-Nitrogen Ressuplement_Nitrogen_Amount
     set lipid_decrease_for ((Ticks)+(10))
     ;room for intermediate code
   ]
   if Resupplementing [
    set Biomass_Growth 0
    set Biomass_Starve_Growth 0
    set Lipid_Growth 0
    set Lipid_Starve_Growth 0
    if Ticks < lipid_decrease_for [
       set Resupplement_Lipid_Loss ((50.155944469522325)*(2))
    ]
    if Ticks > lipid_decrease_for [
      set Resupplement_Lipid_Loss 0
      set Resupplement_Lipid_Growth ((33.37644629696358)/(9))
    ]
    set Resupplement_Biomass_Growth (116210.27305995136)

   ]
   if (starving = false) and (Resupplementing = False) [
     set Biomass_Growth ((108482.9982377443))
;      set Lipid_Growth ((0.2194328737957919))
;      set Biomass_Growth (33.37644629696358)
     set Lipid_Growth (33.37644629696358)
    ]
    if (mg/L-Nitrogen = 0) and ((starving) = false) [stop]
    set Nitrogen_Consumption ((Biomass)/(3112071.285022375))
    set Sal Salinity
    set Temperature Temp
  ]
  if Starve_for_Lipid_Production = false [
    if mg/L-Nitrogen = 0 [stop]

    ;Temp for season: Fall
    if (Ticks < 91) and (Ticks >= 0) [set Temp random-normal Fall_mean_temp Fall_temp_STDEV]
    ;Temp for season: Winter
    if (Ticks < 182) and (Ticks >= 91) [set Temp random-normal Winter_mean_temp Winter_temp_STDEV]
    ;Temp for season: Spring
    if (Ticks < 273) and (Ticks >= 182) [set Temp random-normal Spring_mean_temp Spring_temp_STDEV]
    ;Temp for season: Summer
    if (Ticks < 364) and (Ticks >= 273) [set Temp random-normal Summer_mean_temp Summer_temp_STDEV]
    ;Temp for season: Fall
    if (Ticks < 455) and (Ticks >= 364) [set Temp random-normal Fall_mean_temp Fall_temp_STDEV]
    ;Temp for season: Winter
    if (Ticks < 546) and (Ticks >= 455) [set Temp random-normal Winter_mean_temp Winter_temp_STDEV]
    ;Temp for season: Spring
    if (Ticks < 637) and (Ticks >= 546) [set Temp random-normal Spring_mean_temp Spring_temp_STDEV]
    ;Temp for season: Summer
    if (Ticks < 728) and (Ticks >= 637) [set Temp random-normal Summer_mean_temp Summer_temp_STDEV]
    ;Temp for season: Fall
    if (Ticks < 819) and (Ticks >= 728) [set Temp random-normal Fall_mean_temp Fall_temp_STDEV]
    ;Temp for season: Winter
    if (Ticks < 910) and (Ticks >= 819) [set Temp random-normal Winter_mean_temp Winter_temp_STDEV]
    ;Temp for season: Spring
    if (Ticks < 1001) and (Ticks >= 910) [set Temp random-normal Spring_mean_temp Spring_temp_STDEV]
    ;Temp for season: Summer
    if (Ticks < 1092) and (Ticks >= 1001) [set Temp random-normal Summer_mean_temp Summer_temp_STDEV]
    ;Temp for season: Fall
    if (Ticks < 1183) and (Ticks >= 1092) [set Temp random-normal Fall_mean_temp Fall_temp_STDEV]
    ;Temp for season: Winter
    if (Ticks < 1274) and (Ticks >= 1183) [set Temp random-normal Winter_mean_temp Winter_temp_STDEV]
    ;Temp for season: Spring
    if (Ticks < 1365) and (Ticks >= 1274) [set Temp random-normal Spring_mean_temp Spring_temp_STDEV]
    ;Temp for season: Summer
    if (Ticks < 1456) and (Ticks >= 1365) [set Temp random-normal Summer_mean_temp Summer_temp_STDEV]
    ;Temp for season: Fall
    if (Ticks < 1547) and (Ticks >= 1456) [set Temp random-normal Fall_mean_temp Fall_temp_STDEV]
    ;Temp for season: Winter
    if (Ticks < 1638) and (Ticks >= 1547) [set Temp random-normal Winter_mean_temp Winter_temp_STDEV]
    ;Temp for season: Spring
    if (Ticks < 1729) and (Ticks >= 1638) [set Temp random-normal Spring_mean_temp Spring_temp_STDEV]
    ;Temp for season: Summer
    if (Ticks < 1820) and (Ticks >= 1729) [set Temp random-normal Summer_mean_temp Summer_temp_STDEV]
    ;Temp for season: Fall
    if (Ticks < 1911) and (Ticks >= 1820) [set Temp random-normal Fall_mean_temp Fall_temp_STDEV]
    ;Temp for season: Winter
    if (Ticks < 2002) and (Ticks >= 1911) [set Temp random-normal Winter_mean_temp Winter_temp_STDEV]
    ;Temp for season: Spring
    if (Ticks < 2093) and (Ticks >= 2002) [set Temp random-normal Spring_mean_temp Spring_temp_STDEV]
    ;Temp for season: Summer
    if (Ticks < 2184) and (Ticks >= 2093) [set Temp random-normal Summer_mean_temp Summer_temp_STDEV]
    set PAR_Light random-normal 412.73276190717496 100.66482884736547
    set Salinity random-normal Mean_Sal Sal_STDEV
    set Sal Salinity
    set Temperature Temp
    if Strain = "KA32 - Nannochloropsis Oceanica" [
      set Biomass_Growth abs Growth_biomass_KA32
      set Lipid_Growth abs Growth_lipid_KA32
      set Max_Lipid abs Max_Lipid_KA32
      Set Max_Biomass abs Max_Biomass_KA32
    ]
    if Strain = "LRB-AZ-1201 - Chlorella Vulgaris" [
      set Biomass_Growth abs Growth_biomass_LRB-AZ-1201
      set Lipid_Growth abs Growth_lipid_LRB-AZ-1201
      set Max_Lipid abs Max_Lipid_LRB-AZ-1201
      set Max_Biomass abs Max_Biomass_LRB-AZ-1201
    ]
    if Biomass > ((Max_biomass)*(Harvest_Point)) [set Lipid_Total ((2)*(Max_Lipid)/(3))]
    if (Biomass > ((Max_biomass)*(Harvest_Point))) and starving = False [set Biomass ((2)*(Max_Biomass)/(3))]
    set Lipid_Percent ((((Lipid_Total)* 100 /(Biomass))))
    set Nitrogen_Consumption ((Biomass)/(7500))

  ]
  ;  set Lipid_Percent ((((Lipid_Total)* 100 /(Biomass))))
  print Lipid_in - Lipid_eq
  system-dynamics-go
  set-current-plot "Enviroment"
  system-dynamics-do-plot
  set-current-plot "Nutrient_levels"
  system-dynamics-do-plot
  set-current-plot "Biomass Levels"
  system-dynamics-do-plot
  set-current-plot "Lipid Levels"
  system-dynamics-do-plot
  set-current-plot "Lipid Pecent"
  system-dynamics-do-plot
  set lipid_in2 lput Lipid_in lipid_in2
end
to output
end
@#$#@#$#@
GRAPHICS-WINDOW
7
13
32
40
-1
-1
12.0
1
10
1
1
1
0
1
1
1
0
0
0
0
0
0
1
ticks
30.0

BUTTON
24
285
88
318
NIL
Setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
95
282
171
318
NIL
Start
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
22
442
197
475
user-mg/L-Nitrogen
user-mg/L-Nitrogen
800
4000
4000.0
1
1
mg/L
HORIZONTAL

TEXTBOX
42
184
192
270
Input Values
35
0.0
1

PLOT
433
550
936
1010
Nutrient_levels
Time
mg/L
0.0
100.0
0.0
800.0
true
true
"" ""
PENS
"PAR_Light" 1.0 0 -1184463 true "" ""
"mg/L-Nitrogen" 1.0 0 -10141563 true "" ""

PLOT
945
388
1607
950
Biomass Levels
Time
Mass (mg)
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Biomass" 1.0 0 -15575016 true "" ""

SLIDER
0
975
172
1008
Temp
Temp
0
100
13.10444636519949
1
1
C
HORIZONTAL

SLIDER
0
940
172
973
Salinity
Salinity
0
100
32.66254102576487
1
1
g/L
HORIZONTAL

PLOT
1549
453
2161
1018
Lipid Levels
Time
Mass (mg)
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Lipid_Total" 1.0 0 -13840069 true "" ""

SLIDER
199
445
319
478
Harvest_Point
Harvest_Point
0
1
0.7
.01
1
NIL
HORIZONTAL

PLOT
1032
22
1986
382
Enviroment
Time
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Sal" 1.0 0 -10899396 true "" ""
"Temperature" 1.0 0 -2674135 true "" ""

SLIDER
0
903
173
936
PAR_Light_in
PAR_Light_in
100
600
315.0
1
1
NIL
HORIZONTAL

INPUTBOX
22
489
136
553
Fall_mean_temp
18.0
1
0
Number

INPUTBOX
25
555
134
624
Winter_mean_temp
11.0
1
0
Number

INPUTBOX
15
622
131
694
Spring_mean_temp
17.0
1
0
Number

INPUTBOX
10
695
136
765
Summer_mean_temp
21.0
1
0
Number

INPUTBOX
137
487
235
555
Fall_temp_STDEV
4.0
1
0
Number

INPUTBOX
135
554
256
619
Winter_temp_STDEV
3.0
1
0
Number

INPUTBOX
130
627
258
692
Spring_temp_STDEV
3.0
1
0
Number

INPUTBOX
136
696
262
761
Summer_temp_STDEV
4.0
1
0
Number

INPUTBOX
68
767
136
832
Mean_Sal
29.0
1
0
Number

INPUTBOX
137
767
212
833
Sal_STDEV
2.0
1
0
Number

TEXTBOX
242
500
368
539
Default Fall Values: 18,4
15
0.0
1

TEXTBOX
259
552
398
591
Default Winter Values: 11,3
15
0.0
1

TEXTBOX
262
626
420
674
Deault Spring Values:\n17,3
15
0.0
1

TEXTBOX
266
697
433
735
Default Summer Values:\n21,4
15
0.0
1

TEXTBOX
264
777
431
815
Default Salinity Values:\n29,2
15
0.0
1

INPUTBOX
464
490
554
556
Starvation_start
48.0
1
0
Number

INPUTBOX
560
488
665
558
Starvation_Length
15.0
1
0
Number

CHOOSER
473
439
637
484
Starvation_Start_Trigger
Starvation_Start_Trigger
"Biomass" "Time"
1

SLIDER
439
396
662
429
Ressuplement_Nitrogen_Amount
Ressuplement_Nitrogen_Amount
0
150
141.0
1
1
mg/L
HORIZONTAL

SWITCH
189
282
371
315
Starve_for_Lipid_Production
Starve_for_Lipid_Production
0
1
-1000

TEXTBOX
42
17
403
159
READ INFO TAB BEFORE YOU USE THE MODEL
40
0.0
1

TEXTBOX
48
336
717
395
Biomass Production  Starve for Lipids
40
0.0
1

TEXTBOX
2
860
217
892
IGNORE THESE
20
0.0
1

CHOOSER
61
389
294
434
Strain
Strain
"KA32 - Nannochloropsis Oceanica" "LRB-AZ-1201 - Chlorella Vulgaris"
0

PLOT
418
15
1018
338
Lipid Pecent
Time
Lipid %
0.0
10.0
0.0
50.0
true
true
"" ""
PENS
"Lipid_Percent" 1.0 0 -7500403 true "" ""

@#$#@#$#@
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
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.1
@#$#@#$#@
@#$#@#$#@
1.0
    org.nlogo.sdm.gui.AggregateDrawing 76
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 255 437 50 50
            org.nlogo.sdm.gui.WrappedConverter "user-mg/L-Nitrogen" "mg/L-Nitrogen-init"
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 653 548 60 40
            org.nlogo.sdm.gui.WrappedStock "mg/L-Nitrogen" "mg/L-Nitrogen-init" 1
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 37 330 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 35 290 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 35 246 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 31 197 30 30
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 1293 471 60 40
            org.nlogo.sdm.gui.WrappedStock "Lipid_Total" "(0)" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 675 381 60 40
            org.nlogo.sdm.gui.WrappedStock "Biomass" "(1)" 1
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1260 278 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1140 249 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 618 815 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 874 282 30 30
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 74 251 50 50
            org.nlogo.sdm.gui.WrappedConverter "Temp" "Water_Temp"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 619 758 50 50
            org.nlogo.sdm.gui.WrappedConverter "Salinity" "Water_Salinity"
        org.nlogo.sdm.gui.RateConnection 3 641 568 568 568 221 568 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 3
            org.jhotdraw.figures.ChopEllipseConnector
                org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 191 553 30 30
            org.nlogo.sdm.gui.WrappedRate "Nitrogen_Consumption" "test1" REF 4
                org.nlogo.sdm.gui.WrappedReservoir  0   REF 24
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 521 773 50 50
            org.nlogo.sdm.gui.WrappedConverter "(10000)" "Carrying_cap_Bio"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 356 785 50 50
            org.nlogo.sdm.gui.WrappedConverter "(150)" "Carrying_cap_Lip"
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 897 843 30 30
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 1001 69 50 50
            org.nlogo.sdm.gui.WrappedConverter "((-96.37966875726904)+((Water_Salinity)*(1.4601677358895923333333333333333))+((Water_Temp)*(0.22907407874110366666666666666667))+((mg/L-Nitrogen)*(0.14282486152079826666666666666667)))" "Growth_lipid_KA32"
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1141 286 30 30
        org.nlogo.sdm.gui.RateConnection 3 1171 302 1240 305 1308 459 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 34
            org.jhotdraw.standard.ChopBoxConnector REF 9
            org.nlogo.sdm.gui.WrappedRate "Lipid_Growth" "Lipid_in"
                org.nlogo.sdm.gui.WrappedReservoir  REF 10 0
        org.nlogo.sdm.gui.RateConnection 3 1332 459 1366 352 1398 240 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 9
            org.jhotdraw.figures.ChopEllipseConnector
                org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1386 211 30 30
            org.nlogo.sdm.gui.WrappedRate "((S-curve)*(Lipid_Growth)*(Lipid_Total)/((Max_lipid)))" "Lipid_eq" REF 10
                org.nlogo.sdm.gui.WrappedReservoir  0   REF 43
        org.nlogo.sdm.gui.BindingConnection 2 1332 459 1366 352 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 9
            org.nlogo.sdm.gui.ChopRateConnector REF 40
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 815 57 50 50
            org.nlogo.sdm.gui.WrappedConverter "((-414.865591)+((Water_Salinity)*(3.9223669))+((Water_Temp)*(-0.268911937))+((mg/L-Nitrogen)*(0.36576891))+((PAR_Light)*(-0.0422914982)))" "Growth_biomass_KA32"
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 915 338 30 30
        org.nlogo.sdm.gui.RateConnection 3 918 361 866 390 747 398 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 51
            org.jhotdraw.standard.ChopBoxConnector REF 11
            org.nlogo.sdm.gui.WrappedRate "Biomass_Growth" "Biomass_in"
                org.nlogo.sdm.gui.WrappedReservoir  REF 12 0
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 1039 248 50 50
            org.nlogo.sdm.gui.WrappedConverter "(14455.755354331377)" "Max_lipid_KA32"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 735 173 50 50
            org.nlogo.sdm.gui.WrappedConverter "46640.93510171615" "Max_biomass_KA32"
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 147 204 60 40
            org.nlogo.sdm.gui.WrappedStock "Sal" "Salinity" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 154 304 60 40
            org.nlogo.sdm.gui.WrappedStock "Temperature" "Temp" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 953 680 60 40
            org.nlogo.sdm.gui.WrappedStock "Lipid_Percent" "(0)" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 305 130 60 40
            org.nlogo.sdm.gui.WrappedStock "PAR_Light" "(PAR_Light_in)" 0
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 962 358 60 40
            org.nlogo.sdm.gui.WrappedStock "Biomass_Growth" "(0)" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 1315 64 60 40
            org.nlogo.sdm.gui.WrappedStock "Lipid_Growth" "(0)" 1
        org.nlogo.sdm.gui.BindingConnection 2 950 378 866 390 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 69
            org.nlogo.sdm.gui.ChopRateConnector REF 52
        org.nlogo.sdm.gui.BindingConnection 2 1333 116 1240 305 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 71
            org.nlogo.sdm.gui.ChopRateConnector REF 35
        org.nlogo.sdm.gui.BindingConnection 2 1347 116 1366 352 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 71
            org.nlogo.sdm.gui.ChopRateConnector REF 40
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 1377 700 60 40
            org.nlogo.sdm.gui.WrappedStock "Lipid_Starve_Growth" "(0)" 1
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1415 633 30 30
        org.nlogo.sdm.gui.RateConnection 3 1420 639 1374 600 1337 523 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 84
            org.jhotdraw.standard.ChopBoxConnector REF 9
            org.nlogo.sdm.gui.WrappedRate "Lipid_Starve_Growth" "Lipid_Starve_Growth_in"
                org.nlogo.sdm.gui.WrappedReservoir  REF 10 0
        org.nlogo.sdm.gui.BindingConnection 2 1400 688 1374 600 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 82
            org.nlogo.sdm.gui.ChopRateConnector REF 85
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 594 226 60 40
            org.nlogo.sdm.gui.WrappedStock "Resupplement_Biomass_Growth" "(0)" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 1155 663 60 40
            org.nlogo.sdm.gui.WrappedStock "Resupplement_Lipid_Loss" "(0)" 1
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 385 307 60 40
            org.nlogo.sdm.gui.WrappedStock "Biomass_Starve_Growth" "(0)" 1
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 694 222 30 30
        org.nlogo.sdm.gui.RateConnection 3 709 252 709 307 706 369 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 99
            org.jhotdraw.standard.ChopBoxConnector REF 11
            org.nlogo.sdm.gui.WrappedRate "Resupplement_Biomass_Growth" "Resupplement_Biomass_Growth_in"
                org.nlogo.sdm.gui.WrappedReservoir  REF 12 0
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 520 316 30 30
        org.nlogo.sdm.gui.RateConnection 3 549 336 612 356 663 380 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 105
            org.jhotdraw.standard.ChopBoxConnector REF 11
            org.nlogo.sdm.gui.WrappedRate "Biomass_Starve_Growth" "Biomass_Starve_Growth_in"
                org.nlogo.sdm.gui.WrappedReservoir  REF 12 0
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 718 194 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 527 351 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1272 599 30 30
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1040 408 30 30
        org.nlogo.sdm.gui.RateConnection 3 1283 523 1169 615 1095 629 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 9
            org.jhotdraw.figures.ChopEllipseConnector
                org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1065 615 30 30
            org.nlogo.sdm.gui.WrappedRate "abs(Resupplement_Lipid_Loss)" "Resupplement_Lipid_Growth_out" REF 10
                org.nlogo.sdm.gui.WrappedReservoir  0   REF 118
        org.nlogo.sdm.gui.BindingConnection 2 1186 651 1169 615 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 95
            org.nlogo.sdm.gui.ChopRateConnector REF 115
        org.nlogo.sdm.gui.BindingConnection 2 665 278 709 307 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 93
            org.nlogo.sdm.gui.ChopRateConnector REF 100
        org.nlogo.sdm.gui.BindingConnection 2 457 333 612 356 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 97
            org.nlogo.sdm.gui.ChopRateConnector REF 106
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 497 235 50 50
            org.nlogo.sdm.gui.WrappedConverter "" ""
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 444 444 60 40
            org.nlogo.sdm.gui.WrappedStock "Nitrogen_Consumption" "(0)" 1
        org.nlogo.sdm.gui.BindingConnection 2 460 496 568 568 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 132
            org.nlogo.sdm.gui.ChopRateConnector REF 21
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 912 472 60 40
            org.nlogo.sdm.gui.WrappedStock "Resupplement_Lipid_Growth" "(0)" 1
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 1064 393 30 30
        org.nlogo.sdm.gui.RateConnection 3 1073 421 1044 479 1281 489 NULL NULL 0 0 0
            org.jhotdraw.figures.ChopEllipseConnector REF 139
            org.jhotdraw.standard.ChopBoxConnector REF 9
            org.nlogo.sdm.gui.WrappedRate "Resupplement_Lipid_Growth" "Resupplement_Lipid_Growth_in"
                org.nlogo.sdm.gui.WrappedReservoir  REF 10 0
        org.nlogo.sdm.gui.BindingConnection 2 984 484 1044 479 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 137
            org.nlogo.sdm.gui.ChopRateConnector REF 140
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 1413 364 60 40
            org.nlogo.sdm.gui.WrappedStock "S-curve" "(1)" 1
        org.nlogo.sdm.gui.BindingConnection 2 1401 365 1366 352 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 148
            org.nlogo.sdm.gui.ChopRateConnector REF 40
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 820 114 50 50
            org.nlogo.sdm.gui.WrappedConverter "((192.934914)+((Water_Salinity)*(14.7903458))+((Water_Temp)*(0.511827009))+((mg/L-Nitrogen)*(0.0810408805))+((PAR_Light)*(0.034555862)))" "Growth_Biomass_LRB-AZ-1201"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 1002 119 50 50
            org.nlogo.sdm.gui.WrappedConverter "((-18.686005246538183)+((Water_Salinity)*(0.802536206874621))+((Water_Temp)*(0.17002827749387233333333333333333))+((mg/L-Nitrogen)*(0.01339745549743835333333333333333)))" "Growth_lipid_LRB-AZ-1201"
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 1424 461 60 40
            org.nlogo.sdm.gui.WrappedStock "Max_Lipid" "(0)" 1
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 1098 171 50 50
            org.nlogo.sdm.gui.WrappedConverter "(3689.33318659582)\n;(5677.609812624111)\n;(5875.0397067021895)" "Max_Lipid_LRB-AZ-1201"
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 832 239 60 40
            org.nlogo.sdm.gui.WrappedStock "Max_Biomass" "(1)" 1
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 625 90 50 50
            org.nlogo.sdm.gui.WrappedConverter "(53690.08638857274)" "Max_Biomass_LRB-AZ-1201"
        org.nlogo.sdm.gui.RateConnection 3 746 433 802 475 803 535 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 11
            org.jhotdraw.figures.ChopEllipseConnector
                org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 788 534 30 30
            org.nlogo.sdm.gui.WrappedRate "((S-curve)*(Biomass_Growth)*(Biomass)/((Max_Biomass)))" "Biomass_eq" REF 12
                org.nlogo.sdm.gui.WrappedReservoir  0   REF 168
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
