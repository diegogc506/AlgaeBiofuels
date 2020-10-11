Part 3: NetLogo Model

Getting started:
In order to explore the model, you will need to do two things. Firstly, you will need to clone the GitHub repository. You can do this by typing the following command into command prompt, or by using a git client such as GitHub Desktop. If you will be working with more projects using GitHub, downloading a git client would be useful. 
git clone https://github.com/aabansal/AlgaeBiofuels.git
After you have cloned the repo, you will need to install NetLogo. Go to this link: https://ccl.northwestern.edu/netlogo/download.shtml and download the latest version. 
After you have done both of these steps, open up Algae Biofuel Model.nlogo located in /AlgaeBiofuels/NetLogo.
How to use the NetLogo Model:
To use the model, start by reading the info tab in the file. It will elaborate on everything written here, explaining in detail how the model works. To use the model, choose between modeling lipid growth or biomass growth, and then manipulate the corresponding inputs or leave them as default to observe the model's behavior. Before you run the start button, make sure to click the setup button, or you will get an error. 
Try changing different variables and see how they affect lipid production. Try seeing how Harvest_Point and Nitrogen affects Biomass levels, and how starving for lipid production affects Lipid levels. Try to formulate some reasons as to why these relationships might occur. The strain that was used in the raceway pond model (nitrogen starvation off) was Nannochloropsis Oceanica, and the strain that was used in the nitrogen starvation model (nitrogen starvation on) was Chlamydomonas reinhardti . Try using google to figure out why certain environmental factors affect or don't affect the algae.
How it was made:    
The model was made using the systems dynamic modeler in NetLogo to allow the dynamic flow of conditions off of starting variables. Some inputs control the outputs of random number generators that are used to control daily values, like temperature. Most of the model is generated using custom built code, to get around limitations with NetLogo modeling. 
