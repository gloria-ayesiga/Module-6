This is README file for the Fashion MINST R code file

Dataset
The Fashion MNIST dataset consists of 60,000 training and 10,000 test grayscale images of size 28x28 pixels, each labeled with one of 10 clothing categories:

-T-shirt/top, Trouser, Pullover, Dress, Coat, Sandal, Shirt, Sneaker, Bag, Ankle boot

Project Steps
-Load and Normalize Data
-Images are scaled to the range [0,1] by dividing by 255.

Define CNN Model
-The CNN includes:
-2 Convolutional layers with ReLU activation.
-2 Max Pooling layers.
-Flattening layer.
-Dense output layer with 10 classes and softmax activation.

Compile and Train Model
-Using "adam" optimizer and "sparse_categorical_crossentropy" loss for multi-class classification.

Prediction and Visualization
-The model predicts the first two test images, and they are plotted with the predicted labels.

Requirements
-R (≥ 4.0)
-keras package (install.packages("keras"))
-TensorFlow backend installed via keras::install_keras()

How to Run
r
# Install required package
install.packages("keras")
keras::install_keras()

# Load the libraries
library(keras)

# Execute the provided R script
Sample Prediction Visualization
The code will display the first two images from the test set along with the predicted labels.

Notes
Ensure the data is reshaped to [samples, 28, 28, 1] only during model fitting and prediction.

Dataset remains in 3D [samples, 28, 28] during other operations to avoid unnecessary reshaping and dimension errors.

Author: Gloria Eden Zion Ayesiga
Completed for the fulfiment of Module 6 assignment for BAN6420 course