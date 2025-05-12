
#Fashion MNIST Image Classifier (CNN in Python)

This project builds a **Convolutional Neural Network (CNN)** using **TensorFlow** and **Keras** to classify grayscale images from the **Fashion MNIST** dataset. The model is trained on labeled clothing images and makes predictions for new, unseen test images.


## Features

- Loads and preprocesses the Fashion MNIST dataset
- Builds a 6-layer CNN:
  - 2 Convolution layers
  - 2 MaxPooling layers
  - Flatten + Dense output layer
- Trains the model for 5 epochs
- Evaluates model accuracy
- Displays predictions for two test images with their actual and predicted labels


## Dataset
Fashion MNIST is loaded directly from Keras:

from tensorflow.keras.datasets import fashion_mnist

## Requirements

Make sure you have Python installed (Python 3.10 – 3.12 is recommended).

Install dependencies:

pip install tensorflow matplotlib nltk

## How to run
Download this project.

Run the script in a Python environment (e.g., Jupyter, VS Code, PyCharm, or terminal)
python fashion_cnn.py

## Sample Output
Displays two Fashion MNIST images.

Shows model's prediction vs. actual label.

Prints the model's test accuracy (e.g., Test accuracy: 0.91).

## Class Labels
The Fashion MNIST dataset contains 10 clothing categories:

0 - T-shirt/top
1 - Trouser
2 - Pullover
3 - Dress
4 - Coat
5 - Sandal
6 - Shirt
7 - Sneaker
8 - Bag
9 - Ankle boot

## Results
After training, the model typically achieves around 90% test accuracy after 5 epochs. Accuracy may vary depending on hardware and hyperparameters.

## Visualisation
Two test images are shown using matplotlib, along with predicted and true labels using a blue colormap

## Author
Gloria Eden Zion Ayesiga
Completed for the fulfilment of module 6 assignment for the BAN6420 course