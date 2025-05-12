library(keras)

# Load and normalize
fashion_mnist <- dataset_fashion_mnist()
X_test <- fashion_mnist$test$x / 255
y_test <- fashion_mnist$test$y

# Confirm dimensions
print(dim(X_test) #maintaining the 3D dimension

# Defining model
model <- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = 'relu', input_shape = c(28, 28, 1)) %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = 'relu') %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_flatten() %>%
  layer_dense(units = 10, activation = 'softmax')

model %>% compile(loss = "sparse_categorical_crossentropy", optimizer = "adam", metrics = "accuracy")

# Reshaping only when fitting the model
model %>% fit(array(X_test, dim = c(dim(X_test)[1], 28, 28, 1)), y_test, epochs = 1)

# Predicting for 2 images and adding channel only at prediction
sample_images <- X_test[1:2, , ]
sample_images <- array(sample_images, dim = c(2, 28, 28, 1))

predictions <- model %>% predict(sample_images)
predicted_labels <- apply(predictions, 1, which.max) - 1

# Plotting
class_names <- c("T-shirt/top", "Trouser", "Pullover", "Dress", "Coat",
                 "Sandal", "Shirt", "Sneaker", "Bag", "Ankle boot")

par(mfrow = c(1, 2))
for (i in 1:2) {
  image(1:28, 1:28, t(apply(X_test[i,,], 2, rev)),
        col = gray.colors(255),
        main = paste0("Predicted: ", class_names[predicted_labels[i] + 1]))
}

