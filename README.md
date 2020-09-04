# CommaAI Speed Challenge2017 - TensorFlow solution 

The data for the challenge should be available through Comaai's twitter post : https://twitter.com/comma_ai/status/913196051292499968?lang=en

The preprocessing of the data, architeture of the model and the training scheme is majorly inspired from the articles:
-https://medium.com/weightsandbiases/predicting-vehicle-speed-from-dashcam-video-f6158054f6fd        
-https://github.com/JonathanCMitchell                                         
-https://arxiv.org/pdf/1604.07316v1.pdf

This project provides a containerized setup with the help of Docker tool so that any user could run and do experiments without the complexations coming from numerous version compatability issues. To be able to build and run the given docker image only needed components are:                                             
-machine that has Ubuntu Kernel                                                                                                     
-Nvidia drivercompatable with CUDA 8

