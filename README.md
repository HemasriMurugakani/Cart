# MyCartApp

## Overview

MyCartApp is a simple shopping cart application built using the Flutter framework. The app displays a list of products in the cart, calculates the subtotal, tax, and total price, and provides an interface for the user to proceed to checkout.

## Features

- Display a list of products in the cart.
- Calculate and display the subtotal, tax fee, and total amount.
- Display the number of items in the cart on the app bar.
- Remove items from the cart.
- Navigate back to the previous screen using the back button on the app bar.
- Proceed to checkout (button available, but functionality not implemented).

## Project Structure

- `main.dart`: The main entry point of the application.
- `MyApp`: The root widget of the application.
- `MyCartPage`: The main screen displaying the shopping cart.
- `CartItemWidget`: A widget representing a single item in the cart.
- `Product`: A model class representing a product.
- `products`: A list of sample products used in the cart.

## Installation

To run this project on your local machine, follow these steps:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/mycartapp.git
    ```
2. **Navigate to the project directory:**
    ```bash
    cd mycartapp
    ```
3. **Get the dependencies:**
    ```bash
    flutter pub get
    ```
4. **Run the application:**
    ```bash
    flutter run
    ```

## Dependencies

This project uses the following dependencies:

- `flutter`: The Flutter framework.

Make sure you have Flutter installed on your machine. For installation instructions, visit the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

## Usage

### Main Components

1. **AppBar:**
    - Displays the title "My Cart".
    - Shows a back button to navigate to the previous screen.
    - Shows a shopping cart icon with the number of items in the cart.

2. **CartItemWidget:**
    - Displays product image, name, color, size, quantity, and price.
    - Provides a delete button to remove the item from the cart (functionality not fully implemented).

3. **Price Summary:**
    - Displays the subtotal, delivery fee (fixed as "Free"), tax fee, and total amount.
    - Provides a "Proceed to Checkout" button.

### Calculations

- **Subtotal:** Calculated as the sum of the price of each product multiplied by its quantity.
- **Total:** Calculated as the subtotal plus a fixed tax fee of $25.00.

### Sample Products

The app uses a list of sample products defined in the `products` list. Each product has the following attributes:

- `name`: The name of the product.
- `color`: The color of the product.
- `size`: The size of the product.
- `quantity`: The quantity of the product.
- `price`: The price of the product.
- `imageUrl`: A URL to an image of the product.

## Future Enhancements

- Add functionality to navigate to a checkout screen.
- Enhance the UI with more detailed styling.
- Add user authentication and persistent cart storage.
- Integrate with a backend service to fetch and manage products.



