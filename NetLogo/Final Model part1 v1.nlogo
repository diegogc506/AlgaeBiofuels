globals [
  ;;other needed varivables

  ;;constants
  PAR
  Temperature-Celcius
  Salinity-g/L
  Temperature-Kelvin
  ;;stock values
  Nitrogen
  Lipid
  Biomass
  Lipid%
  Nitrogen_Consumption
  Lipid-Growth
  Biomass-Growth
  Lipid-Max
  Biomass-Max
  ;; size of each step, see SYSTEM-DYNAMICS-GO
  dt
]

to Setup
  ca
  system-dynamics-setup
end

to Start
  if Nitrogen = 0 [stop]
  if Strain = "KA32 - Nannochloropsis Oceanica" [
    set Lipid-Growth Lipid-Growth_KA32
    set Biomass-Growth Biomass-Growth_KA32
    set Lipid-Max Lipid-Max_KA32
    set Biomass-Max Biomass-Max_KA32
    set Nitrogen_Consumption Biomass / 1000
  ]
  if Strain = "LRB-AZ-1201 - Chlorella Vulgaris" [
    set Lipid-Growth Lipid-Growth_LRB
    set Biomass-Growth Biomass-Growth_LRB
    set Lipid-Max Lipid-Max_LRB
    set Biomass-Max Biomass-Max_LRB
    set Nitrogen_Consumption Biomass / 1000
  ]
  set Lipid% ((Lipid * 100)/( Biomass ))
  system-dynamics-go
  set-current-plot "Photosynthetically Active Radiation"
  system-dynamics-do-plot
  set-current-plot "Environment"
  system-dynamics-do-plot
  set-current-plot "Lipid Levels"
  system-dynamics-do-plot
  set-current-plot "Biomass Levels"
  system-dynamics-do-plot
  set-current-plot "Nitrogen Levels"
  system-dynamics-do-plot
end

;; Initializes the system dynamics model.
;; Call this in your model's SETUP procedure.
to system-dynamics-setup
  reset-ticks
  set dt 1.0
  ;; initialize constant values
  set PAR Photosynthetically-Active-Radiation
  set Temperature-Celcius Temperature
  set Salinity-g/L Salinity
  set Temperature-Kelvin Temperature + 237.15
  ;; initialize stock values
  set Nitrogen Initial-Nitrogen
  set Lipid 0
  set Biomass 1
  set Lipid% 0
  set Nitrogen_Consumption 0
  set Lipid-Growth 0
  set Biomass-Growth 0
  set Lipid-Max 0
  set Biomass-Max 0
end


;; Step through the system dynamics model by performing next iteration of Euler's method.
;; Call this in your model's GO procedure.
to system-dynamics-go
  ;; compute variable and flow values once per step
  let local-Lipid-Growth_KA32 Lipid-Growth_KA32
  let local-Biomass-Growth_KA32 Biomass-Growth_KA32
  let local-Biomass-Growth_LRB-AZ-1201 Biomass-Growth_LRB
  let local-Lipid-Growth_LRB Lipid-Growth_LRB
  let local-Lipid-Max_LRB Lipid-Max_LRB
  let local-Lipid-Max_KA32 Lipid-Max_KA32
  let local-Biomass-Max_KA32 Biomass-Max_KA32
  let local-Biomass-Max_LRB Biomass-Max_LRB
  let local-Lipid-in Lipid-in
  let local-Lipid-eq Lipid-eq
  let local-Biomass-in Biomass-in
  let local-Biomass-eq Biomass-eq
  let local-Nitrogen-out Nitrogen-out
;  let

  ;; update stock values
  ;; use temporary variables so order of computation doesn't affect result.
  let new-Biomass max( list 1 ( Biomass + local-Biomass-in - local-Biomass-eq ) )
  let new-Lipid max( list 0 ( Lipid + local-Lipid-in - local-Lipid-eq ) )
  let new-Nitrogen max( list 0 ( Nitrogen - local-Nitrogen-out ) )
  let new-Nitrogen_Consumption max( list 0 ( Nitrogen_Consumption ) )
  let new-Lipid% max( list 0 ( Lipid% ) )
  let new-Lipid-Growth max( list 0 (Lipid-Growth) )
  let new-Biomass-Growth max( list 0 (Biomass-Growth) )
  let new-Lipid-Max max( list 0 (Lipid-Max) )
  let new-Biomass-Max max( list 0 (Biomass-Max) )
  set Nitrogen new-Nitrogen
  set Lipid new-lipid
  set Biomass new-Biomass
  set Lipid% new-Lipid%
  set Nitrogen_Consumption new-Nitrogen_Consumption
  set Lipid-Growth new-Lipid-Growth
  set Biomass-Growth new-Biomass-Growth
  set Lipid-Max new-Lipid-Max
  set Biomass-Max new-Biomass-Max
;  set test11 new-test11
;

  tick-advance dt
end

;; Report value of flow
to-report Lipid-in
  report ( Lipid-Growth
  ) * dt
end

;; Report value of flow
to-report Biomass-in
  report ( Biomass-Growth
  ) * dt
end

;; Report value of flow
to-report Lipid-eq
  report ( (Lipid-Growth)*(Lipid)/((Lipid-Max))
  ) * dt
end

;; Report value of flow
to-report Biomass-eq
  report ( (Biomass-Growth)*(Biomass)/((Biomass-Max))
  ) * dt
end

;; Report value of flow
to-report Nitrogen-Out
  report ( Nitrogen_Consumption
    ) * dt
end

;; Report value of variable
to-report Lipid-Growth_KA32
  report ((((1000)*(1 - exp (-((1.7)*(PAR)/(1000)))) * (exp (-((1.7)*(PAR)/(1000))))/(250)) + ( -(0.002501 * (Temperature-Celcius)^ 4) + (0.1466 * (Temperature-Celcius)^ 3) - (3.088 * (Temperature-Celcius)^ 2) + ( 27.32 * (Temperature-Celcius)) - (70.28) ) + ( - (0.0000002417 * (Nitrogen)^ 5) + (0.00004616 * (Nitrogen)^ 4) - (0.003228 * (Nitrogen)^ 3) + (0.1001 * (Nitrogen)^ 2) - (1.373 * (Nitrogen)) + (21.01) ) + (- (0.002071 * (Salinity-g/L)^ 5) + (0.3216 * (Salinity-g/L)^ 4) - (19.91 * (Salinity-g/L)^ 3) + (614.5 * (Salinity-g/L)^ 2) - (9448 * (Salinity-g/L)) + (57920) ) ) / 4)
end

;; Report value of variable
to-report Lipid-Growth_LRB
  report ( ( ( - (0.0000004484 * (PAR)^ 3) + (0.0007584 * (PAR)^ 2) - (0.2099 * (PAR)) + (226) ) + ( - (0.0399 * (Temperature-Celcius)^ 5) + (3.363 * (Temperature-Celcius)^ 4) - (111.5 * (Temperature-Celcius)^ 3) + (1820 * (Temperature-Celcius)^ 2) - (14630 * (Temperature-Celcius)) + (46670) ) + ( (0.002688 * (Nitrogen)^ 3) - (0.4502 * (Nitrogen)^ 2) + (24.37 * (Nitrogen) - (189.3) ) + ( - (28.49 * (Salinity-g/L)^ 2) + (133.2 * (Salinity-g/L)) + (130.7) ) ) / 4))
end

;; Report value of variable
to-report Biomass-Growth_KA32
  report  abs ( ( (  - (0.00000000000002301125 * (PAR)^ 7) + (0.00000000006532325 * (PAR)^ 6) - (0.0000000764855 * (PAR)^ 5) + (0.00004757025 * (PAR)^ 4) - (0.01682025 * (PAR)^ 3) + (3.344575 *(PAR)^ 2) - (339.1725 * (PAR)) + (13304.5) ) + ( (0.240875 * (Temperature-Celcius)^ 4) - (16.2975 * (Temperature-Celcius)^ 3) + (402.3125 * (Temperature-Celcius)^ 2) - (4273.225 * (Temperature-Celcius)) + (16676.75) ) + ( - (0.0002485625 * (Nitrogen)^ 4) + (0.0340505 * (Nitrogen)^ 3) - (1.476 * (Nitrogen)^ 2) + (19.95675 * (Nitrogen)) + (277.16) ) + ( - (0.1077275 * (Salinity-g/L)^ 6) + (19.9875 * (Salinity-g/L)^ 5) - (1541.6 * (Salinity-g/L)^ 4) + (63283.5 * (Salinity-g/L)^ 3) - (1457550 * (Salinity-g/L)^ 2) + (17855500 * (Salinity-g/L)) - (90958500) ) ) / 16)
end

;; Report value of variable
to-report Biomass-Growth_LRB
  report abs ( ( ( ( - (0.000000000006822 * (PAR)^ 5) + (0.00000001324 * (PAR)^ 4) - (0.00000959 * (PAR)^ 3) + (0.003192 * (PAR)^ 2) - (0.4828 * (PAR)) + (32.69) ) + ( - (0.005419 * (Temperature-Celcius)^ 2) + (0.01781 * (Temperature-Celcius)) + (7.138) ) + ( - (0.001261 * (Nitrogen)^ 2)) + (0.129 * (Nitrogen)) + (2.949) ) + ( - (4.567 * (Salinity-g/L)^ 4) + (30.53 * (Salinity-g/L)^ 3) - (71.14 * (Salinity-g/L)^ 2) + (66.48 * (Salinity-g/L)) - (15.05) ) ) / 16)
end

;; Report value of variable
to-report Lipid-Max_KA32
  report 20000
end

;; Report value of variable
to-report Lipid-Max_LRB
  report 3000
end

;; Report value of variable
to-report Biomass-Max_KA32
  report 1000000000000
end

;; Report value of variable
to-report Biomass-Max_LRB
  report 1000000000000
end


;; Plot the current state of the system dynamics model's stocks
;; Call this procedure in your plot's update commands.
to system-dynamics-do-plot
  if plot-pen-exists? "Nitrogen" [
   set-current-plot-pen "Nitrogen"
   plotxy ticks Nitrogen
  ]
  if plot-pen-exists? "Lipid" [
   set-current-plot-pen "Lipid"
   plotxy ticks Lipid
  ]
  if plot-pen-exists? "Biomass" [
   set-current-plot-pen "Biomass"
   plotxy ticks Biomass
  ]
  if plot-pen-exists? "Lipid%" [
   set-current-plot-pen "Lipid%"
   plotxy ticks Lipid%
  ]
  if plot-pen-exists? "Nitrogen_Consumption" [
    set-current-plot-pen "Nitrogen_Consumption"
    plotxy ticks Nitrogen_Consumption
  ]
  if plot-pen-exists? "Lipid-Growth" [
    set-current-plot-pen "Lipid-Growth"
    plotxy ticks Lipid-Growth
  ]
  if plot-pen-exists? "Biomass-Growth" [
    set-current-plot-pen "Biomass-Growth"
    plotxy ticks Biomass-Growth
  ]
  if plot-pen-exists? "Lipid-Max" [
    set-current-plot-pen "Lipid-Max"
    plotxy ticks Lipid-Max
  ]
  if plot-pen-exists? "Biomass-Max" [
    set-current-plot-pen "Biomass-Max"
    plotxy ticks Biomass-Max
  ]
    if plot-pen-exists? "Temperature-Celcius" [
    set-current-plot-pen "Temperature-Celcius"
    plotxy ticks Temperature-Celcius
  ]
    if plot-pen-exists? "Salinity-g/L" [
    set-current-plot-pen "Salinity-g/L"
    plotxy ticks Salinity-g/L
  ]
    if plot-pen-exists? "PAR" [
    set-current-plot-pen "PAR"
    plotxy ticks PAR
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
0
10
33
44
-1
-1
25.0
1
0
1
1
1
0
0
0
1
0
0
0
0
0
0
0
ticks
3.0

SLIDER
129
322
588
355
Photosynthetically-Active-Radiation
Photosynthetically-Active-Radiation
0
3000
405.0
1
1
umol/(m*m*s)
HORIZONTAL

BUTTON
123
141
187
174
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
191
142
254
175
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

CHOOSER
125
175
372
220
Strain
Strain
"KA32 - Nannochloropsis Oceanica" "LRB-AZ-1201 - Chlorella Vulgaris"
0

SLIDER
126
220
298
253
Initial-Nitrogen
Initial-Nitrogen
1000
4000
4000.0
1
1
mg/L
HORIZONTAL

SLIDER
128
256
300
289
Temperature
Temperature
10
40
25.0
1
1
°C
HORIZONTAL

SLIDER
127
288
299
321
Salinity
Salinity
0
50
26.0
1
1
g/L
HORIZONTAL

PLOT
634
121
1066
458
Photosynthetically Active Radiation
Time
umol/(m*m*s)
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"PAR" 1.0 0 -4079321 true "" ""

PLOT
636
471
1070
756
Environment
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
"Temperature-Celcius" 1.0 0 -2674135 true "" ""
"Salinity-g/L" 1.0 0 -13345367 true "" ""

PLOT
1070
439
1443
757
Lipid Levels
Time
%
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Lipid%" 1.0 0 -11085214 true "" ""

PLOT
1076
123
1448
439
Biomass Levels
Time
mg
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Biomass" 1.0 0 -8732573 true "" ""

PLOT
101
386
611
783
Nitrogen Levels
Time
mg/L
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Nitrogen" 1.0 0 -10141563 true "" ""

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
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
