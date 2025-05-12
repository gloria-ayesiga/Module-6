# Load necessary libraries
library(keras)

# Load and normalize Fashion MNIST data
fashion_mnist <- dataset_fashion_mnist()

X_train <- fashion_mnist$train$x / 255
X_test <- fashion_mnist$test$x / 255
y_train <- fashion_mnist$train$y
y_test <- fashion_mnist$test$y

# Reshaping  to 4D [samples, 28, 28, 1]
X_train <- array_reshape(X_train, c(dim(X_train)[1], 28, 28, 1))
X_test <- array_reshape(X_test, c(dim(X_test)[1], 28, 28, 1))

# Confirm dimensions
cat("Train data shape: ", dim(X_train), "\n")
cat("Test data shape: ", dim(X_test), "\n")

# class names
class_names <- c("T-shirt/top", "Trouser", "Pullover", "Dress", "Coat",
                 "Sandal", "Shirt", "Sneaker", "Bag", "Ankle boot")

# Defining the CNN model (6 layers)
model <- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = 'relu', input_shape = c(28, 28, 1)) %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = 'relu') %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_flatten() %>%
  layer_dense(units = 10, activation = 'softmax')

# Compiling the model
model %>% compile(
  loss = "sparse_categorical_crossentropy",
  optimizer = "adam",
  metrics = c("accuracy")
)

# Training the model
model %>% fit(
  X_train, y_train,
  epochs = 5,
  validation_split = 0.1
)

# Selecting the first 2 images
sample_images <- X_test[1:2,,, drop = FALSE]  #code produces a persistent dimension error here that I am struggling to figure out what the root cause is
sample_labels <- y_test[1:2]

# Predict
predictions <- model %>% predict(sample_images)
predicted_labels <- apply(predictions, 1, which.max) - 1 

# Plotting predictions
par(mfrow = c(1, 2))  
for (i in 1:2) {
  image_to_plot <- sample_images[i,,,1]
  image(1:28, 1:28, t(apply(image_to_plot, 2, rev)),
        col = gray.colors(255),
        main = paste0("True: ", class_names[sample_labels[i] + 1],
                      "\nPredicted: ", class_names[predicted_labels[i] + 1]))
}
