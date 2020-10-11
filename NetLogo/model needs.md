some of these may have been gotten already, but i don't have them anymore (lost the document where i was storing them),
and i want to have a single file with all correlations listed in the final output, in case i ever need to fix issues with the model(s)

Raceway Var Names:
	• PAR- (PAR)
	• Temperature- (Temperature-Celcius)
	• Nitrogen- (Nitrogen)
	• Salinity- (Salinity-g/L)

Needed correlations for raceway model:
	• KA32:
		• Biomass: 
			• PAR - ( - (0.00000000000002301125 * (PAR)^ 7) + (0.00000000006532325 * (PAR)^ 6) - (0.0000000764855 * (PAR)^ 5) + (0.00004757025 * (PAR)^ 4) - (0.01682025 * (PAR)^ 3) + (3.344575 *(PAR)^ 2) - (339.1725 * (PAR)) + (13304.5) )
			• Temperature - ( (0.240875 * (Temperature-Celcius)^ 4) - (16.2975 * (Temperature-Celcius)^ 3) + (402.3125 * (Temperature-Celcius)^ 2) - (4273.225 * (Temperature-Celcius)) + (16676.75) )
			• Nitrogen - ( - (0.0002485625 * (Nitrogen)^ 4) + (0.0340505 * (Nitrogen)^ 3) - (1.476 * (Nitrogen)^ 2) + (19.95675 * (Nitrogen)) + (277.16) )
			• Salinity - ( - (0.1077275 * (Salinity-g/L)^ 6) + (19.9875 * (Salinity-g/L)^ 5) - (1541.6 * (Salinity-g/L)^ 4) + (63283.5 * (Salinity-g/L)^ 3) - (1457550 * (Salinity-g/L)^ 2) + (17855500 * (Salinity-g/L)) - (90958500) )
		• Lipid:
			• PAR - done
			• Temperature - ( -(0.002501 * (Temperature-Celcius)^ 4) + (0.1466 * (Temperature-Celcius)^ 3) - (3.088 * (Temperature-Celcius)^ 2) + ( 27.32 * (Temperature-Celcius)) - (70.28) )
			• Nitrogen - ( - (0.0000002417 * (Nitrogen)^ 5) + (0.00004616 * (Nitrogen)^ 4) - (0.003228 * (Nitrogen)^ 3) + (0.1001 * (Nitrogen)^ 2) - (1.373 * (Nitrogen)) + (21.01) )
			• Salinity - (- (0.002071 * (Salinity-g/L)^ 5) + (0.3216 * (Salinity-g/L)^ 4) - (19.91 * (Salinity-g/L)^ 3) + (614.5 * (Salinity-g/L)^ 2) - (9448 * (Salinity-g/L)) + (57920) )
		• Nitrogen consumption from Biomass Level
	• LRB:
		• Biomass: 
			• PAR - ( - (0.000000000006822 * (PAR)^ 5) + (0.00000001324e * (PAR)^ 4) - (0.00000959 * (PAR)^ 3) + (0.003192 * (PAR)^ 2) - (0.4828 * (PAR)) + (32.69) )
			• Temperature - ( - (0.005419 * (Temperature-Celcius)^ 2) + (0.01781 * (Temperature-Celcius)) + (7.138) )
			• Nitrogen  - ( - (0.001261 * (Nitrogen)^ 2)) + (0.129 * (Nitrogen)) + (2.949) )
			• Salinity - ( - (4.567 * (Salinity-g/L)^ 4) + (30.53 * (Salinity-g/L)^ 3) - (71.14 * (Salinity-g/L)^ 2) + (66.48 * (Salinity-g/L)) - (15.05) )
		• Lipid:
			• PAR - ( - (0.0000004484 * (PAR)^ 3) + (0.0007584 * (PAR)^ 2) - (0.2099 * (PAR)) + (226) )
			• Temperature - ( - (0.0399 * (Temperature-Celcius)^ 5) + (3.363 * (Temperature-Celcius)^ 4) - (111.5 * (Temperature-Celcius)^ 3) + (1820 * (Temperature-Celcius)^ 2) - (14630 * (Temperature-Celcius)) + (46670) )
			• Nitrogen - ( (0.002688 * (Nitrogen)^ 3) - (0.4502 * (Nitrogen)^ 2) + (24.37 * (Nitrogen) - (189.3) )
			• Salinity - ( - (28.49 * (Salinity-g/L)^ 2) + (133.2 * (Salinity-g/L)) + (130.7) )
		• Nitrogen consumption from Biomass Level

Needed correlations for lab model:
	•Biomass:
		• Replete
		• Starvation
		• Resupplementation
	•Lipid:
		• Replete
		• Starvation
		• Resupplementation (maybe two parts, decrease then increase?)
	• Nitrogen consumption from Biomass Level